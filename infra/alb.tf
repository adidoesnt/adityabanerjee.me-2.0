# AWS ACM certificate
variable "acm_certificate_arn" {
  type = string
  default = "arn:aws:acm:eu-west-2:839459181456:certificate/a14524dc-64ae-4ebb-8211-9f6f294c5f1f"
}

# ALB for Directus
resource "aws_lb" "abme_directus_alb" {
    name = "abme-directus-alb"
    internal = false
    load_balancer_type = "application"

    security_groups = [
        aws_security_group.abme_directus_alb_sg.id
    ]

    subnets = [
        aws_subnet.abme_directus_public_subnet_1.id,
        aws_subnet.abme_directus_public_subnet_2.id
    ]

    enable_deletion_protection = false

    tags = {
        Name = "abme-directus-alb"
    }
}

# Target group for ECS task
resource "aws_lb_target_group" "abme_directus_ecs_task_target_group" {
    name = "abme-directus-target-group"
    port = 8055
    protocol = "HTTP"
    vpc_id = aws_vpc.abme_directus_vpc.id
    target_type = "ip"

    health_check {
        enabled = true
        path = "/server/health"
        port = 8055
        protocol = "HTTP"
        interval = 60
        healthy_threshold = 5
        unhealthy_threshold = 5
    }

    tags = {
        Name = "abme-directus-target-group"
    }
}

# HTTP listener for ALB
resource "aws_lb_listener" "abme_directus_alb_listener" {
    load_balancer_arn = aws_lb.abme_directus_alb.arn
    port = 80
    protocol = "HTTP"

    default_action {
        type = "forward"
        target_group_arn = aws_lb_target_group.abme_directus_ecs_task_target_group.arn
    }
}

# HTTPS listener for ALB
resource "aws_lb_listener" "abme_directus_alb_https_listener" {
    load_balancer_arn = aws_lb.abme_directus_alb.arn
    port = 443
    protocol = "HTTPS"
    certificate_arn = var.acm_certificate_arn

    default_action {
        type = "forward"
        target_group_arn = aws_lb_target_group.abme_directus_ecs_task_target_group.arn
    }
}
