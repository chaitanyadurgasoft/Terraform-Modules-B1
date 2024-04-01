resource "aws_eip" "mod-eip" {
  domain   = "vpc"
}

resource "aws_nat_gateway" "mod-ngw" {
  allocation_id = aws_eip.mod-eip.id
  subnet_id     = var.publicsubnet_1

  tags = {
    Name = "${var.vpc_name}-NGW"
  }
}