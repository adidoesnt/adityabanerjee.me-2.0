# DB subnet group
resource "aws_db_subnet_group" "abme_directus_db_subnet_group" {
    name = "abme_directus_db_subnet_group"
    description = "Subnet group for Directus DB"

    # Place the DB in the private subnets, since only the ECS task needs access to it
    subnet_ids = [
        aws_subnet.abme_directus_private_subnet_1.id,
        aws_subnet.abme_directus_private_subnet_2.id
    ]

    tags = {
        Name = "abme_directus_db_subnet_group"
    }
}

# DB instance
resource "aws_db_instance" "abme_directus_db" {
    identifier = "abme-directus-db"

    allocated_storage = 20 # Free tier
    storage_type = "gp2" # Free tier

    engine = "postgres"
    engine_version = "17.2"

    instance_class = "db.t3.micro" # Free tier

    db_name = "directus"

    username = "directus"
    password = random_password.abme_directus_db_password.result

    vpc_security_group_ids = [
        aws_security_group.abme_directus_rds_sg.id
    ]
    db_subnet_group_name = aws_db_subnet_group.abme_directus_db_subnet_group.name

    multi_az = false # Free tier
    publicly_accessible = false

    backup_retention_period = 7 # Free tier
    skip_final_snapshot = true # Free tier

    tags = {
        Name = "abme_directus_db"
    }
}