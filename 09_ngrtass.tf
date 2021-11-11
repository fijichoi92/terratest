resource "aws_route_table_association" "khchoi_ngrtas_a"{
  subnet_id      = aws_subnet.khchoi_pria.id
  route_table_id = aws_route_table.khchoi_ngrt.id
}
resource "aws_route_table_association" "khchoi_ngrtas_c"{
  subnet_id      = aws_subnet.khchoi_pric.id
  route_table_id = aws_route_table.khchoi_ngrt.id
}