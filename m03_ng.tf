resource "aws_eip" "khchoi_eip_ng" {
  vpc = true
}

resource "aws_nat_gateway" "khchoi_ng" {
  allocation_id = aws_eip.khchoi_eip_ng.id
  subnet_id     = aws_subnet.khchoi_pub[0].id
  tags = {
    "Name" = "${var.name}-ng"
  }
  depends_on = [
    aws_internet_gateway.khchoi_ig
  ]
}

resource "aws_route_table" "khchoi_ngrt" {
  vpc_id = aws_vpc.khchoi_vpc.id

  route {
    cidr_block = var.cidr_route
    gateway_id = aws_nat_gateway.khchoi_ng.id
  }

  tags = {
    "Name" = "${var.name}-ngrt"
  }
}

resource "aws_route_table_association" "khchoi_ngrtas"{
  count          = length(var.cidr_public)
  subnet_id      = aws_subnet.khchoi_pri[count.index].id
  route_table_id = aws_route_table.khchoi_ngrt.id
}