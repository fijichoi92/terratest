resource  "aws_vpc" "khchoi_vpc" {
  cidr_block  = "10.0.0.0/16"
  tags = {
    "Name" = "khchoi-vpc"
  }
}