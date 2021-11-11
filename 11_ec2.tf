/*
data "aws_ami" "amzn" {
  most_recent = true

  filter {
    name = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name = "virturalization-type"
    values = ["hvm"]
  }

  owners = ["amazon"]
}
*/

resource "aws_instance" "khchoi_web" {
  ami = "ami-04e8dfc09b22389ad"
  instance_type = "t2.micro"
  key_name = "khchoi2_key"
  availability_zone = "ap-northeast-2a"
  private_ip = "10.0.0.11"
  subnet_id = aws_subnet.khchoi_puba.id
  vpc_security_group_ids = [aws_security_group.khchoi_sg.id]
  user_data = <<-EOF
                #!/bin/bash
                sudo su -
                yum install -y httpd
                echo "KHCHOI-Terraform-1" >> /var/www/html/index.html
                systemctl start httpd
                EOF
}

resource "aws_eip" "khchoi_weba_ip" {
  vpc = true
  instance = aws_instance.khchoi_web.id
  associate_with_private_ip = "10.0.0.11"
  depends_on = [
    aws_internet_gateway.khchoi_ig
  ]
}