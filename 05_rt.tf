resource "aws_route_table" "khchoi_rt" {
  vpc_id = aws_vpc.khchoi_vpc.id

  route  {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.khchoi_ig.id
  }
  tags = {
    "Name" = "khchoi-rt"
  }
}