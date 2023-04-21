resource "aws_ec2_managed_prefix_list" "enokawa" {
  name           = "${var.env}-${var.prefix}-enokawa-1"
  address_family = "IPv4"
  max_entries    = 2

  entry {
    cidr        = "10.0.0.10/32" # Set your own IP range.
    description = "enokawa"
  }

  entry {
    cidr        = "10.0.16.10/32" # Set your own IP range.
    description = "naoto"
  }

  tags = {
    Env = "${var.env}-${var.prefix}-enokawa-1"
  }
}

resource "aws_security_group" "ec2_bastion" {
  name        = "${var.env}-${var.prefix}-ec2-bastion-1"
  description = ""
  vpc_id      = var.vpc_id

  tags = {
    Name = "${var.env}-${var.prefix}-ec2-bastion-1"
  }
}

resource "aws_security_group_rule" "ec2_bastion_ingress_allow_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  prefix_list_ids   = [aws_ec2_managed_prefix_list.enokawa.id]
  security_group_id = aws_security_group.ec2_bastion.id
}

resource "aws_security_group_rule" "ec2_bastion_egress_allow_all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ec2_bastion.id
}
