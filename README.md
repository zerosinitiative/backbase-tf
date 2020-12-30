# Terraform module to create EKS cluster in existing VPC and Subnets

```ruby
module "eks-test" {
  source = "../.."
  providers = {
    aws = aws
  }
  vpc_id     = "vpc-368a7b4b"
  subnet_ids = ["subnet-83a90ce5", "subnet-7335932c", "subnet-298cf964", "subnet-f349e9d2", "subnet-5d62fd53"]
  tags = {
    "Environment" = "Backbase-dev"
  }
}
```

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |
| random | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| subnet\_ids | The list of subnet IDs to place the EKS cluster | `list(string)` | n/a | yes |
| vpc\_id | The VPC ID to create the EKS control plane and data nodes and security groups | `string` | n/a | yes |
| cluster\_version | The cluster version of EKS K8s to use | `string` | `"1.17"` | no |
| custom\_rules | Custom SG rules to apply for the k8s worker nodes as an additional security group will be created and added | <pre>map(object({<br>    type        = string,<br>    from_port   = number,<br>    to_port     = number,<br>    protocol    = string,<br>    cidr_blocks = list(string)<br>  }))</pre> | `{}` | no |
| tags | The tags to associate with all resources created through this module | `map(any)` | `{}` | no |

## Outputs

No output.

