resource "aws_lb_target_group_attachment" "khchoi_tgatt" {
  target_group_arn = aws_lb_target_group.khchoi_albtg.arn
  target_id        = aws_instance.khchoi_web.id
  port             = 80
}
