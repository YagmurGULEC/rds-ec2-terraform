data "aws_vpc" "main" {
  id = var.vpc_id
}

data "aws_subnet" "private_1" {
  id = var.private_subnet_1
}

data "aws_subnet" "private_2" {
  id = var.private_subnet_2
}

resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "${var.project_name}-db-subnet-group"
  subnet_ids = [data.aws_subnet.private_1.id, data.aws_subnet.private_2.id]

  tags = {
    Name = "${var.project_name}-db-subnet-group"
  }
}

resource "aws_security_group" "rds_sg" {
  name        = "${var.project_name}-rds-sg"
  description = "Security group for the RDS instance"
  vpc_id      = var.vpc_id

  ingress {
    from_port = 3306
    to_port   = 3306
    protocol  = "tcp"
    # cidr_blocks = ["YourIP/32"] # Replace with your IP or CIDR block
    security_groups = [var.bastion_sg_id] # Allow access from the bastion host


  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


