# ECS task role 
resource "aws_iam_role" "abme_directus_ecs_task_role" {
    name = "abme_directus_ecs_task_role"
    description = "ECS task role for Directus"

    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Action = "sts:AssumeRole"
                Effect = "Allow"
                Sid = ""
                Principal = {
                    Service = "ecs-tasks.amazonaws.com"
                }
            }
        ]
    })
}

# ECS task role policy (allows secrets manager)
resource "aws_iam_policy" "abme_directus_ecs_task_role" {
    name = "abme_directus_ecs_task_role_policy"
    description = "ECS task role policy for Directus"

    policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Action = "secretsmanager:GetSecretValue"
                Effect = "Allow"
                Resource = aws_secretsmanager_secret.abme_directus_db_credentials.arn
            }
        ]
    })
}

resource "aws_iam_role_policy_attachment" "abme_directus_ecs_task_policy_attachment" {
    role = aws_iam_role.abme_directus_ecs_task_role.name
    policy_arn = aws_iam_policy.abme_directus_ecs_task_role.arn
}