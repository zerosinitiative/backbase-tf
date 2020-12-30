resource "aws_security_group" "worker_group_mgmt_one" {
  name_prefix = "worker_group_mgmt_one"
  vpc_id      = "vpc-368a7b4b"

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = [
      "172.31.0.0/16",
      "27.5.177.248/32",
      "107.20.145.18/32"
    ]
  }
}

resource "aws_security_group" "all_worker_mgmt" {
  name_prefix = "all_worker_management"
  vpc_id      = "vpc-368a7b4b"

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = [
      "172.31.0.0/16",
      "27.5.177.248/32",
      "107.20.145.18/32"
    ]
  }
}