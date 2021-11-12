resource "aws_launch_configuration" "khchoi_aslc" {
  name_prefix = "khchoi-web-"
  image_id = aws_ami_from_instance.khchoi_ami.id
  instance_type = "t2.micro"
  iam_instance_profile = "admin_role"
  security_groups = [aws_security_group.khchoi_sg.id]
  key_name = "khchoi2_key"
#  user_data =  없음으로 패스

  lifecycle {
    create_before_destroy = true
  }
}