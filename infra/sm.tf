# Generate a random password for the DB
resource "random_password" "abme_directus_db_password" {
    length = 16
    special = true
    upper = true
    lower = true
    numeric = true
}

resource "aws_secretsmanager_secret" "abme_directus_db_credentials" {
    name = "abme_directus_db_credentials"
    description = "DB credentials for Directus"
}

resource "aws_secretsmanager_secret_version" "abme_directus_db_credentials" {
    secret_id = aws_secretsmanager_secret.abme_directus_db_credentials.id
    secret_string = jsonencode({
        username = "directus"
        password = random_password.abme_directus_db_password.result
    })
}

# Generate a random password for the Directus admin user
resource "random_password" "abme_directus_admin_password" {
    length = 16
    special = true
    upper = true
    lower = true
    numeric = true
}

resource "aws_secretsmanager_secret" "abme_directus_admin_credentials" {
    name = "abme_directus_admin_credentials"
    description = "Admin credentials for Directus"
}

resource "aws_secretsmanager_secret_version" "abme_directus_admin_credentials" {
    secret_id = aws_secretsmanager_secret.abme_directus_admin_credentials.id
    secret_string = jsonencode({
        email = "admin@adityabanerjee.me"
        password = random_password.abme_directus_admin_password.result
    })
}

# Generate secret for Directus JWT secret
resource "random_password" "abme_directus_secret" {
    length = 16
    special = true
    upper = true
    lower = true
    numeric = true
}

resource "aws_secretsmanager_secret" "abme_directus_secret" {
    name = "abme_directus_secret"
    description = "Secret for Directus"
}

resource "aws_secretsmanager_secret_version" "abme_directus_secret" {
    secret_id = aws_secretsmanager_secret.abme_directus_secret.id
    secret_string = jsonencode({
        secret = random_password.abme_directus_secret.result
    })
}
