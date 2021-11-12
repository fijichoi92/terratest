resource "aws_lb_target_group" "khchoi_albtg" {
  name      = "khchoi-albtg"
  port      = 80
  protocol  = "HTTP"
  # target_type은 default가 "instance"여서 따로 지정안함.
  vpc_id    = aws_vpc.khchoi_vpc.id

  health_check {
    enabled             = true
    healthy_threshold   = 3
    interval            = 5
    matcher             = "200"
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 2
    unhealthy_threshold = 2
  }
}

output "alb_dns" {
  value = aws_lb.khchoi_alb.dns_name
}