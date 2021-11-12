resource "aws_lb_listener" "khchoi_albli" {
  load_balancer_arn = aws_lb.khchoi_alb.arn
  port = "80"
  protocol = "HTTP"
# HTTPS가 아니라서 ssl_policy, certificate_arn은 생략

  default_action {
  type = "forward"
  target_group_arn = aws_lb_target_group.khchoi_albtg.arn
  }
}
