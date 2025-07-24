

resource "aws_db_instance" "mysql" {
  identifier          = "${var.project_name}-mysql-db"
  engine              = "mysql"
  engine_version      = "8.0"         # Free tier supports 8.0
  instance_class      = "db.t3.micro" # Free tier eligible
  allocated_storage   = 20            # Minimum for MySQL
  storage_type        = "gp2"
  username            = var.db_username
  password            = var.db_password
  db_name             = var.db_name
  skip_final_snapshot = true
  publicly_accessible = false # Use bastion or IP-based access
  multi_az            = false # Free tier = single AZ only

  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]

  tags = {
    Name = "${var.project_name}-mysql-db"
  }

  depends_on = [aws_db_subnet_group.rds_subnet_group]
}
