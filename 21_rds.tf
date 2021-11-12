resource "aws_db_instance" "khchoi_rds" {
  allocated_storage = 20
  storage_type = "gp2"
  engine = "mysql"
  engine_version = "8.0"
  instance_class = "db.t2.micro"
  name = "test"
  identifier = "test"
  username = "admin"
  password = "dinho2005!"
  parameter_group_name = "default.mysql8.0"
  availability_zone = "ap-northeast-2a"
  db_subnet_group_name = aws_db_subnet_group.khchoi_dbsb.id
  vpc_security_group_ids = [aws_security_group.khchoi_sg.id]
  skip_final_snapshot = true
  tags = {
    "Name" = "khchoi-rds"
  }
}

resource "aws_db_subnet_group" "khchoi_dbsb" {
  name = "khchoi-dbsb-group"
  subnet_ids = [aws_subnet.khchoi_pridba.id,aws_subnet.khchoi_pridbc.id]
  tags = {
    "Name" = "khchoi-dbsb-group"
  }
}
