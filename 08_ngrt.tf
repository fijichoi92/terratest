resource "aws_route_table" "khchoi_ngrt" {
  vpc_id = aws_vpc.khchoi_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.khchoi_ng.id
  }

  tags = {
    "Name" = "khchoi-ngrt"
  }
}