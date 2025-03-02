provider "aws" {
  profile = "default"
  region  = "eu-west-2"
}

variable "abme_directus_s3_access_key_id" {
  description = "AWS Access Key ID for Directus S3"
  type        = string
}

variable "abme_directus_s3_secret_access_key" {
  description = "AWS Secret Access Key for Directus S3"
  type        = string
}

terraform {
  backend "s3" {
    bucket  = "abme-tf-state"
    key     = "infra/terraform.tfstate"
    region  = "eu-west-2"
    profile = "abme"

    dynamodb_table = "abme-tf-state-lock"
    encrypt        = true
  }
}
