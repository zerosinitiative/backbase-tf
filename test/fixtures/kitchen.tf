provider "aws" {
  region  = "us-east-1"
  version = ">= 3.1.0"
}

provider "kubernetes" {
  version = ">= 1.9.0"
}

module "eks-test" {
  source = "../.."
  providers = {
    aws = aws
    kubernetes = kubernetes
  }
  vpc_id     = "vpc-368a7b4b"
  subnet_ids = ["subnet-83a90ce5", "subnet-7335932c", "subnet-298cf964", "subnet-f349e9d2", "subnet-5d62fd53"]
  tags = {
    "Environment" = "Backbase-dev"
  }
}