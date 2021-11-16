resource "aws_ami_from_instance" "khchoi_ami" {
  name               = "khchoi-ami"
  source_instance_id = aws_instance.khchoi_web.id

  depends_on = [
    aws_instance.khchoi_web
  ]
}

resource "aws_launch_configuration" "khchoi_aslc" {
  name_prefix          = "khchoi-web-"
  image_id             = aws_ami_from_instance.khchoi_ami.id
  instance_type        = var.default_instance
  iam_instance_profile = var.admin_role
  security_groups      = [aws_security_group.khchoi_sg.id]
  key_name             = var.key
  #  user_data =  없음으로 패스

  #lifecycle {
  #  create_before_destroy = true
  #}
}

resource "aws_placement_group" "khchoi_place" {
  name     = "khchoi-place"
  strategy = var.place_str
}

resource "aws_autoscaling_group" "khchoi_asg" {
  name                      = "khchoi-asg"
  min_size                  = var.asg_min
  max_size                  = var.asg_max
  health_check_grace_period = 10
  health_check_type         = "EC2"
  desired_capacity          = var.asg_cap
  force_delete              = true
  launch_configuration      = aws_launch_configuration.khchoi_aslc.name
  vpc_zone_identifier       = [aws_subnet.khchoi_pub[0].id, aws_subnet.khchoi_pub[1].id]

}

resource "aws_autoscaling_attachment" "khchoi_asgalbatt" {
  autoscaling_group_name = aws_autoscaling_group.khchoi_asg.id
  alb_target_group_arn   = aws_lb_target_group.khchoi_albtg.arn
}