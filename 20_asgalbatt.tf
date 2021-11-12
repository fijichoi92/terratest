resource "aws_autoscaling_attachment" "khchoi_asgalbatt" {
  autoscaling_group_name = aws_autoscaling_group.khchoi_asg.id
  alb_target_group_arn = aws_lb_target_group.khchoi_albtg.arn
}