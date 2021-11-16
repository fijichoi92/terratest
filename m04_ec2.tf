resource "aws_security_group" "khchoi_sg" {
  name = "Allow Basic"
  description = "Allow HTTP,SSH,SQL,ICMP"
  vpc_id = aws_vpc.khchoi_vpc.id

  ingress = [
    {
      description       = "Allow ${var.protocol_http}"
      from_port         = var.port_http
      to_port           = var.port_http
      protocol          = var.protocol_main
      cidr_blocks       = [var.cidr_route]
      ipv6_cidr_blocks  = [var.cidr_ipv6]
      prefix_list_ids   = null
      security_groups   = null
      self              = null
    },
    {
      description       = "Allow ${var.protocol_ssh}"
      from_port         = var.port_ssh
      to_port           = var.port_ssh
      protocol          = var.protocol_main
      cidr_blocks       = [var.cidr_route]
      ipv6_cidr_blocks  = [var.cidr_ipv6]
      prefix_list_ids   = null
      security_groups   = null
      self              = null
    },
    {
      description       = "Allow ${var.protocol_sql}"
      from_port         = var.port_sql
      to_port           = var.port_sql
      protocol          = var.protocol_main
      cidr_blocks       = [var.cidr_route]
      ipv6_cidr_blocks  = [var.cidr_ipv6]
      prefix_list_ids   = null
      security_groups   = null
      self              = null
    },
    {
      description       = "Allow ICMP"
      from_port         = var.port_zero
      to_port           = var.port_zero
      protocol          = "icmp"
      cidr_blocks       = [var.cidr_route]
      ipv6_cidr_blocks  = [var.cidr_ipv6]
      prefix_list_ids   = null
      security_groups   = null
      self              = null
    }
  ]
  egress = [
    {
      description       = "ALL"
      from_port         = var.port_zero
      to_port           = var.port_zero
      protocol          = -1
      cidr_blocks       = [var.cidr_route]
      ipv6_cidr_blocks  = [var.cidr_ipv6]
      prefix_list_ids   = null
      security_groups   = null
      self              = null
    }
  ]
  tags = {
    "Name" = "${var.name}-sg"
  }
}

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
  ami = var.ami_amazon_linux
  instance_type = var.default_instance
  key_name = var.key
  availability_zone = "${var.region}${var.ava[0]}"
  private_ip = var.private_ip
  subnet_id = aws_subnet.khchoi_pub[0].id
  vpc_security_group_ids = [aws_security_group.khchoi_sg.id]
  user_data = file("./install.sh")
}

resource "aws_eip" "khchoi_weba_ip" {
  vpc = true
  instance = aws_instance.khchoi_web.id
  associate_with_private_ip = var.private_ip
  depends_on = [
    aws_internet_gateway.khchoi_ig
  ]
}