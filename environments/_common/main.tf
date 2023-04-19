module "vpc" {
  source = "../../modules/vpc"

  aws_vpc_cidr_block = var.aws_vpc_cidr_block
  prefix             = var.prefix
}
