# ECS execution role
resource "aws_iam_role" "abme_directus_ecs_execution_role" {
  name        = "abme_directus_ecs_execution_role"
  description = "ECS execution role for Directus"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      }
    ]
  })
}

# ECS task role 
resource "aws_iam_role" "abme_directus_ecs_task_role" {
  name        = "abme_directus_ecs_task_role"
  description = "ECS task role for Directus"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      }
    ]
  })
}

# ECS task role policy (allows secrets manager)
resource "aws_iam_policy" "abme_directus_ecs_policy" {
  name        = "abme_directus_ecs_policy"
  description = "ECS task role policy for Directus"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "secretsmanager:GetSecretValue"
        Effect = "Allow"
        Resource = [
          aws_secretsmanager_secret.abme_directus_db_credentials.arn,
          aws_secretsmanager_secret.abme_directus_admin_credentials.arn,
          aws_secretsmanager_secret.abme_directus_secret.arn,
          aws_secretsmanager_secret.directus_s3_credentials.arn
        ]
      },
      {
        Action = [
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        Effect = "Allow"
        Resource = [
          "${aws_cloudwatch_log_group.abme_directus_log_group.arn}:*"
        ]
      },
      {
        Effect = "Allow"
        Action = [
          "ecr:GetAuthorizationToken",
          "ecr:BatchCheckLayerAvailability",
          "ecr:GetDownloadUrlForLayer",
          "ecr:BatchGetImage"
        ]
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "abme_directus_ecs_execution_policy_attachment" {
  role       = aws_iam_role.abme_directus_ecs_execution_role.name
  policy_arn = aws_iam_policy.abme_directus_ecs_policy.arn
}

# Create Directus S3 Admin Policy
resource "aws_iam_policy" "abme_directus_s3_admin_policy" {
  name        = "abme_directus_s3_admin_policy"
  description = "Directus S3 Admin Policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "*"
        Effect = "Allow"
        Resource = [
          "${aws_s3_bucket.directus.arn}",
          "${aws_s3_bucket.directus.arn}/*"
        ]
      }
    ]
  })
}


# Create Directus S3 Admin Group
resource "aws_iam_group" "abme_directus_s3_admin_group" {
  name = "abme_directus_s3_admin_group"
}

resource "aws_iam_group_policy_attachment" "abme_directus_s3_admin_group_policy_attachment" {
  group      = aws_iam_group.abme_directus_s3_admin_group.name
  policy_arn = aws_iam_policy.abme_directus_s3_admin_policy.arn
}
