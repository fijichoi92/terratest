resource "aws_eip" "khchoi_eip_ng" {
  vpc = true
}

resource "aws_nat_gateway" "khchoi_ng" {
  allocation_id = aws_eip.khchoi_eip_ng.id
  subnet_id     = aws_subnet.khchoi_puba.id
  tags = {
    "Name" = "khchoi-ng"
  }
  depends_on = [
    aws_internet_gateway.khchoi_ig
  ]
}