resource "aws_ami_from_instance" "khchoi_ami" {
  name               = "khchoi-ami"
  source_instance_id = aws_instance.khchoi_web.id

  depends_on = [
    aws_instance.khchoi_web
  ]
}