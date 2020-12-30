variable "custom_rules" {
  description = "Custom SG rules to apply for the k8s worker nodes as an additional security group will be created and added"
  type = map(object({
    type        = string,
    from_port   = number,
    to_port     = number,
    protocol    = string,
    cidr_blocks = list(string)
  }))
  default = {}
}

variable "vpc_id" {
  description = "The VPC ID to create the EKS control plane and data nodes and security groups"
  type        = string
}

variable "subnet_ids" {
  description = "The list of subnet IDs to place the EKS cluster"
  type        = list(string)
}

variable "cluster_version" {
  description = "The cluster version of EKS K8s to use"
  type        = string
  default     = "1.17"
}

variable "tags" {
  description = "The tags to associate with all resources created through this module"
  type        = map(any)
  default     = {}
}