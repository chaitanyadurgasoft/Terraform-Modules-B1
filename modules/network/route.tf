resource "aws_route_table" "mod_Public_Table" {
  vpc_id = aws_vpc.mod_vpc.id
  route {
    cidr_block="0.0.0.0/0"
    gateway_id = aws_internet_gateway.mod_igw.id
  }
  tags = {
    Name= "${var.vpc_name}-PublicRoute"
  }
}

resource "aws_route_table_association" "mod_public_route_assocaition" {
  count=length(var.Publicsubnet_cidr)
  route_table_id = aws_route_table.mod_Public_Table.id
  subnet_id = element(aws_subnet.mod_PublicSubnet.*.id, count.index)
}

resource "aws_route_table" "mod_Private_Table" {
  vpc_id = aws_vpc.mod_vpc.id
  route {
    cidr_block="0.0.0.0/0"
    gateway_id = var.nat_gw
  }
  tags = {
    Name= "${var.vpc_name}-PrivateRoute"
  }
}

resource "aws_route_table_association" "mod_private_route_assocaition" {
  count=length(var.Privatesubnet_cidr)
  route_table_id = aws_route_table.mod_Private_Table.id
  subnet_id = element(aws_subnet.mod_PrivateSubnet.*.id, count.index)
}