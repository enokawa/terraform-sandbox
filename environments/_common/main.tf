module "vpc" {
  source = "../../modules/vpc"

  aws_vpc_cidr_block = local.aws_vpc_cidr_block
  prefix             = local.prefix
}
