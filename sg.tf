resource "aws_security_group" "worker_group_mgmt_one" {
  name        = "worker_group_mgmt_one"
  vpc_id      = var.vpc_id
  description = "Additional security group for worker nodes of EKS"
}

resource "aws_security_group_rule" "worker_node_rules" {
  for_each          = var.custom_rules
  type              = each.value.type
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  cidr_blocks       = each.value.cidr_blocks
  security_group_id = aws_security_group.worker_group_mgmt_one.id
}