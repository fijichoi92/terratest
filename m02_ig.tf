# 10.0.0.0/16 VPC 전용 Internet Gateway
resource "aws_internet_gateway" "khchoi_ig" {
  vpc_id = aws_vpc.khchoi_vpc.id

  tags = {
    "Name" = "${var.name}_ig"
  }
}

resource "aws_route_table" "khchoi_rt" {
  vpc_id = aws_vpc.khchoi_vpc.id

  route {
    cidr_block = var.cidr_route
    gateway_id = aws_internet_gateway.khchoi_ig.id
  }
  tags = {
    "Name" = "${var.name}-rt"
  }
}

resource "aws_route_table_association" "khchoi_rtas" {
  count          = length(var.cidr_public)
  subnet_id      = aws_subnet.khchoi_pub[count.index].id
  route_table_id = aws_route_table.khchoi_rt.id
}
