resource "aws_cloudwatch_log_group" "abme_directus_log_group" {
  name              = "/ecs/abme_directus_ecs_service"
  retention_in_days = 30

  tags = {
    Name = "abme_directus_log_group"
  }
}