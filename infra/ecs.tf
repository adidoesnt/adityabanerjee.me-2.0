# ECS task definition for Directus
resource "aws_ecs_task_definition" "abme_directus_ecs_task" {
    family = "abme_directus"
    network_mode = "awsvpc"
    requires_compatibilities = ["FARGATE"] # Fargate container (serverless)

    cpu = "256"
    memory = "512"

    execution_role_arn = aws_iam_role.abme_directus_ecs_execution_role.arn
    task_role_arn = aws_iam_role.abme_directus_ecs_task_role.arn

    # TODO: Add logging configuration
    # TODO: Add public URL from the ALB
    container_definitions = jsonencode([{
        "name": "abme_directus",
        "image": "directus/directus:latest",
        "memory": 512,
        "cpu": 256,
        "essential": true,
        "portMappings": [{
            "containerPort": 8055,
            "hostPort": 8055,
            "protocol": "tcp"
        }],
        "environment": [{
            "name": "DB_CLIENT",
            "value": "pg"
        }, {
            "name": "DB_HOST",
            "value": "${aws_db_instance.abme_directus_db.endpoint}"
        }, {
            "name": "DB_DATABASE",
            "value": "${aws_db_instance.abme_directus_db.db_name}"
        }],
        "secrets": [{
            "name": "DB_USER",
            "valueFrom": "${aws_secretsmanager_secret.abme_directus_db_credentials.arn}:username::"
        }, {
            "name": "DB_PASSWORD",
            "valueFrom": "${aws_secretsmanager_secret.abme_directus_db_credentials.arn}:password::"
        }, {
            "name": "ADMIN_EMAIL",
            "valueFrom": "${aws_secretsmanager_secret.abme_directus_admin_credentials.arn}:email::"
        }, {
            "name": "ADMIN_PASSWORD",
            "valueFrom": "${aws_secretsmanager_secret.abme_directus_admin_credentials.arn}:password::"
        }]
    }])

    tags = {
        Name = "abme_directus_ecs_task"
    }

    depends_on = [ 
        aws_db_instance.abme_directus_db,
        aws_secretsmanager_secret.abme_directus_db_credentials,
        aws_secretsmanager_secret.abme_directus_admin_credentials
    ]
}