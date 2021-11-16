resource "aws_db_instance" "khchoi_rds" {
  allocated_storage = var.rds_stor
  storage_type = var.rds_type
  engine = var.rds_engine
  engine_version = var.rds_engine_ver
  instance_class = var.rds_class
  name = var.rds_name
  identifier = var.rds_name
  username = var.rds_user
  password = var.rds_pass
  parameter_group_name = "default.${var.rds_engine}${var.rds_engine_ver}"
  availability_zone = "${var.region}${var.ava[0]}"
  db_subnet_group_name = aws_db_subnet_group.khchoi_dbsb.id
  vpc_security_group_ids = [aws_security_group.khchoi_sg.id]
  skip_final_snapshot = true
  tags = {
    "Name" = "${var.name}-rds"
  }
}

resource "aws_db_subnet_group" "khchoi_dbsb" {
  name = "khchoi-dbsb-group"
  subnet_ids = [aws_subnet.khchoi_pridb[0].id,aws_subnet.khchoi_pridb[1].id]
  tags = {
    "Name" = "${var.name}-dbsb-group"
  }
}
