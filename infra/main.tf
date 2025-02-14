provider "aws" {
  profile = "default"
  region  = "eu-west-2"
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
