resource "aws_lb" "test" {
  name               =var.nlbname
  internal           = false
  load_balancer_type = "network"
  subnets            = var.subnets

  enable_deletion_protection = false
   tags = {
    env = var.env
  }
}
resource "aws_lb_target_group" "test_tg" {
  name     = var.tgname
  port     = 80
  protocol = "TCP"
  vpc_id   = var.vpc_id
}
resource "aws_lb_target_group_attachment" "test" {
  count = var.env== "Prod" ? 3:2
  target_group_arn = aws_lb_target_group.test_tg.arn
  target_id        = "${element(var.PrivateServers,count.index)}"
  port             = 80
}