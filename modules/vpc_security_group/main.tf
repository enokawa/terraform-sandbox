resource "aws_security_group" "ec2_bastion" {
  name        = "${var.env}-${var.prefix}-ec2-bastion-1"
  description = ""
  vpc_id      = var.vpc_id

  tags = {
    Name = "${var.env}-${var.prefix}-ec2-bastion-1"
  }
}
