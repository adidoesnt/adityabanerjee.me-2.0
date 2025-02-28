resource "aws_ecr_repository" "abme_directus_ecr" {
  name = "abme-directus"
  force_delete = true

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = "abme-directus-ecr"
  }
}
