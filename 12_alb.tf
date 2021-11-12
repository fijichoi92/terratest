resource "aws_lb" "khchoi_alb" {
  name = "khchoi-alb"
  internal = false
  load_balancer_type = "application"
  security_groups = [aws_security_group.khchoi_sg.id]
  subnets = [aws_subnet.khchoi_puba.id,aws_subnet.khchoi_pubc.id]

  tags = {
    "Name" = "khchoi-alb"
  }
}