# ALB Security Group
resource "aws_security_group" "abme_directus_alb_sg" {
    name = "abme_directus_alb_sg"
    description = "Allow inbound HTTP and HTTPS traffic to ALB"
    vpc_id = aws_vpc.abme_directus_vpc.id

    # Allow inbound HTTP traffic
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    # Allow inbound HTTPS traffic
    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    # Allow all outbound traffic
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1" # All protocols
        cidr_blocks = ["0.0.0.0/0"]
    }
}

# ECS Task Security Group
resource "aws_security_group" "abme_directus_ecs_task_sg" {
    name = "abme_directus_ecs_task_sg"
    description = "Allow inbound HTTP and HTTPS traffic from the ALB to the ECS task"
    vpc_id = aws_vpc.abme_directus_vpc.id

    # Allow inbound HTTP traffic from the ALB
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        security_groups = [ aws_security_group.abme_directus_alb_sg.id ]
    }

    # Allow inbound HTTPS traffic from the ALB
    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        security_groups = [ aws_security_group.abme_directus_alb_sg.id ]
    }

    # Allow all outbound traffic
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1" # All protocols
        cidr_blocks = ["0.0.0.0/0"]
    }
}

# RDS Security Group
resource "aws_security_group" "abme_directus_rds_sg" {
    name = "abme_directus_rds_sg"
    description = "Allow inbound custom TCP traffic from the ALB to the RDS"
    vpc_id = aws_vpc.abme_directus_vpc.id

    # Allow inbound custom TCP traffic from the ECS task
    ingress {
        from_port = 5432
        to_port = 5432
        protocol = "tcp"
        security_groups = [ aws_security_group.abme_directus_ecs_task_sg.id ]
    }

    # Allow all outbound traffic
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1" # All protocols
        cidr_blocks = ["0.0.0.0/0"]
    }
}
