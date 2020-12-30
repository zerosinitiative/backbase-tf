module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = local.cluster_name
  cluster_version = "1.17"
  subnets         = ["subnet-83a90ce5","subnet-7335932c","subnet-298cf964","subnet-f349e9d2","subnet-5d62fd53"]

  tags = {
    Environment = "backbase-dev"
  }

  vpc_id = "vpc-368a7b4b"

  worker_groups = [
    {
      name                          = "worker-group-1"
      instance_type                 = "t2.large"
      asg_desired_capacity          = 1
      additional_security_group_ids = [aws_security_group.worker_group_mgmt_one.id]
    }
  ]
}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}