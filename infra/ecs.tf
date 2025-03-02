# ECS task definition for Directus
resource "aws_ecs_task_definition" "abme_directus_ecs_task" {
    family = "abme_directus"
    network_mode = "awsvpc"
    requires_compatibilities = ["FARGATE"] # Fargate container (serverless)

    cpu = "256"
    memory = "512"

    execution_role_arn = aws_iam_role.abme_directus_ecs_execution_role.arn
    task_role_arn = aws_iam_role.abme_directus_ecs_task_role.arn

    # TODO: Add public URL from the ALB
    container_definitions = jsonencode([{
        "name": "abme_directus",
        "image": "${aws_ecr_repository.abme_directus_ecr.repository_url}:latest",
        "memory": 512,
        "cpu": 256,
        "essential": true,
        "portMappings": [{
            "containerPort": 8055,
            "hostPort": 8055,
            "protocol": "tcp"
        }],
        "logConfiguration" : {
            "logDriver" : "awslogs",
            "options" : {
                "awslogs-group" : "/ecs/abme_directus_ecs_service",
                "awslogs-region" : "eu-west-2",
                "awslogs-stream-prefix" : "ecs"
            }
        },
        "environment": [{
            "name": "DB_CLIENT",
            "value": "pg"
        }, {
            "name": "DB_HOST",
            "value": "${aws_db_instance.abme_directus_db.address}"
        }, {
            "name": "DB_PORT",
            "value": "5432"
        }, {
            "name": "DB_DATABASE",
            "value": "${aws_db_instance.abme_directus_db.db_name}"
        }, {
            "name": "WEBSOCKETS_ENABLED",
            "value": "true"
        }, {
            "name": "PUBLIC_URL",
            "value": "http://${aws_lb.abme_directus_alb.dns_name}"
        }, {
            "name": "DB_SSL",
            "value": "true"
        }, {
            "name": "DB_SSL_CA",
            "value": "/etc/ssl/certs/global-bundle.pem"
        }, {
            "name": "NODE_EXTRA_CA_CERTS",
            "value": "/etc/ssl/certs/global-bundle.pem"
        }, {
            "name": "STORAGE_LOCATIONS",
            "value": "s3"
        }, {
            "name": "STORAGE_S3_DRIVER",
            "value": "s3"
        }, {
            "name": "STORAGE_S3_BUCKET",
            "value": "${aws_s3_bucket.directus.id}"
        }, {
            "name": "STORAGE_S3_ENDPOINT",
            "value": "s3-eu-west-2.amazonaws.com"
        }, {
            "name": "STORAGE_S3_REGION",
            "value": "eu-west-2"
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
        }, {
            "name": "SECRET",
            "valueFrom": "${aws_secretsmanager_secret.abme_directus_secret.arn}:secret::"
        }, {
            "name": "STORAGE_S3_KEY",
            "valueFrom": "${aws_secretsmanager_secret.aws_credentials.arn}:aws_access_key_id::"
        }, {
            "name": "STORAGE_S3_SECRET",
            "valueFrom": "${aws_secretsmanager_secret.aws_credentials.arn}:aws_secret_access_key::"
        }]
    }])

    tags = {
        Name = "abme_directus_ecs_task"
    }

    depends_on = [ 
        aws_db_instance.abme_directus_db,
        aws_secretsmanager_secret.abme_directus_db_credentials,
        aws_secretsmanager_secret.abme_directus_admin_credentials,
        aws_cloudwatch_log_group.abme_directus_log_group
    ]
}

# ECS cluster for Directus
resource "aws_ecs_cluster" "abme_directus_ecs_cluster" {
    name = "abme_directus_ecs_cluster"

    tags = {
        Name = "abme_directus_ecs_cluster"
    }
}

# ECS Service for Directus
resource "aws_ecs_service" "abme_directus_ecs_service" {
    name = "abme_directus_ecs_service"
    cluster = aws_ecs_cluster.abme_directus_ecs_cluster.id
    task_definition = aws_ecs_task_definition.abme_directus_ecs_task.arn
    desired_count = 1

    launch_type = "FARGATE"

    network_configuration {
        subnets = [
            aws_subnet.abme_directus_private_subnet_1.id,
            aws_subnet.abme_directus_private_subnet_2.id
        ]

        security_groups = [
            aws_security_group.abme_directus_ecs_task_sg.id
        ]

        assign_public_ip = false
    }

    load_balancer {
        target_group_arn = aws_lb_target_group.abme_directus_ecs_task_target_group.arn
        container_name = "abme_directus"
        container_port = 8055
    }

    depends_on = [ 
        aws_lb_listener.abme_directus_alb_listener,
        aws_lb_listener.abme_directus_alb_https_listener
    ]

    tags = {
        Name = "abme_directus_ecs_service"
    }
}
