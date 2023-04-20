resource "aws_vpc" "vpc" {
  cidr_block           = var.aws_vpc_cidr_block
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.env}-${var.prefix}-vpc"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.env}-${var.prefix}-igw"
  }
}

resource "aws_subnet" "public_1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.aws_subnet_cidr_block_public_1
  availability_zone       = var.aws_subnet_az1
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.env}-${var.prefix}-public-1"
  }
}
