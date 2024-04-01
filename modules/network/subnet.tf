resource "aws_subnet" "mod_PublicSubnet" {
  count             = length(var.Publicsubnet_cidr)
  vpc_id            = aws_vpc.mod_vpc.id
  availability_zone = element(var.az, count.index)
  cidr_block        = element(var.Publicsubnet_cidr, count.index)
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.vpc_name}-PublicSubnet-${count.index + 1}"
    Env  = var.env
  }
}

resource "aws_subnet" "mod_PrivateSubnet" {
  count             = length(var.Privatesubnet_cidr)
  vpc_id            = aws_vpc.mod_vpc.id
  availability_zone = element(var.az, count.index)
  cidr_block        = element(var.Privatesubnet_cidr, count.index)
  tags = {
    Name = "${var.vpc_name}-PrivatecSubnet-${count.index + 1}"
    Env  = var.env
  }
}
