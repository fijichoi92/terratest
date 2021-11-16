resource "aws_lb" "khchoi_alb" {
  name               = "khchoi-alb"
  internal           = false
  load_balancer_type = var.lb_type
  security_groups    = [aws_security_group.khchoi_sg.id]
  subnets            = [aws_subnet.khchoi_pub[0].id, aws_subnet.khchoi_pub[1].id]

  tags = {
    "Name" = "${var.name}-alb"
  }
}

resource "aws_lb_target_group" "khchoi_albtg" {
  name     = "khchoi-albtg"
  port     = var.port_http
  protocol = var.protocol_http1
  # target_type은 default가 "instance"여서 따로 지정안함.
  vpc_id = aws_vpc.khchoi_vpc.id

  health_check {
    enabled             = true
    healthy_threshold   = 3
    interval            = 5
    matcher             = var.hc_matcher
    path                = var.hc_path
    port                = var.hc_port
    protocol            = var.protocol_http1
    timeout             = 2
    unhealthy_threshold = 2
  }
}

output "alb_dns" {
  value = aws_lb.khchoi_alb.dns_name
}

resource "aws_lb_listener" "khchoi_albli" {
  load_balancer_arn = aws_lb.khchoi_alb.arn
  port              = var.port_http
  protocol          = var.protocol_http1
  # HTTPS가 아니라서 ssl_policy, certificate_arn은 생략

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.khchoi_albtg.arn
  }
}

resource "aws_lb_target_group_attachment" "khchoi_tgatt" {
  target_group_arn = aws_lb_target_group.khchoi_albtg.arn
  target_id        = aws_instance.khchoi_web.id
  port             = var.port_http
}
