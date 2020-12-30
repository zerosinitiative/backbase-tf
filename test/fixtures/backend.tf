terraform {
  backend "s3" {
    bucket         = "backbase-terraform-backend"
    encrypt        = true
    dynamodb_table = "backbase-tf-lock"
    region         = "us-east-1"
    key            = "tfstate/terraform.tfstate"
  }
}