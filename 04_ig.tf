resource "aws_internet_gateway" "khchoi_ig" {
  vpc_id = aws_vpc.khchoi_vpc.id

  tags = {
    "Name" = "khchoi_ig"
  }
}