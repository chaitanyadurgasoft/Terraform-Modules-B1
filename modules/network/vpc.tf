resource "aws_vpc" "mod_vpc" {
  cidr_block = var.vpc_cidr
enable_dns_hostnames = true
tags={
    Name=var.vpc_name
    Env=var.env
}
}

resource "aws_internet_gateway" "mod_igw" {
  vpc_id = aws_vpc.mod_vpc.id
  tags = {
    Name="${var.vpc_name}-IGW"
  }
}