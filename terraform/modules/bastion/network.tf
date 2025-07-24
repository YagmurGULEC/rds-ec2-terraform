
data "aws_vpc" "main" {
  id = var.vpc_id
}
data "aws_subnet" "public_a" {
  id = var.public_subnet_1
}

resource "aws_security_group" "bastion_sg" {
  name        = "${var.project_name}-bastion-sg"
  description = "Security group for the bastion host"
  vpc_id      = var.vpc_id
  # Allow SSH access from anywhere but can be restricted to specific IPs such as your office IP
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    #cidr_blocks = ["<your_office_ip>/32"] # Uncomment to restrict access
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}



