resource "aws_route_table_association" "khchoi_rtas_a"{
  subnet_id      = aws_subnet.khchoi_puba.id
  route_table_id = aws_route_table.khchoi_rt.id
}
resource "aws_route_table_association" "khchoi_rtas_c"{
  subnet_id      = aws_subnet.khchoi_pubc.id
  route_table_id = aws_route_table.khchoi_rt.id
}