resource "aws_security_group" "mod_sg" {
  vpc_id      = var.vpc_id
  description = "allow all"
  name        = "AllTraffic"
  tags = {
    Name = "${var.vpc_name}-PublicSG"
    env  = var.env
  }
  dynamic "ingress" {
    for_each = var.source_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  dynamic "ingress" {
    for_each = toset(local.port_in)
    content {
      from_port = ingress.value
      to_port = ingress.value
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

    dynamic "egress" {
    for_each = toset(local.port_out)
    content {
      from_port = egress.value
      to_port = egress.value
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}
