variable "region" {
  description = "The AWS region to deploy resources in"
  type        = string

}
variable "project_name" {
  description = "Name of the project"
  type        = string
}
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}
variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}
variable "private_subnet_cidr_1" {
  description = "CIDR block for the private subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "private_subnet_cidr_2" {
  description = "CIDR block for the second private subnet"
  type        = string
  default     = "10.0.3.0/24"
}

variable "availability_zone_1" {
  description = "Availability zone for the first private subnet"
  type        = string
}

variable "availability_zone_2" {
  description = "Availability zone for the second private subnet"
  type        = string
}
variable "instance_type" {
  description = "Instance type for the database"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Name of the key pair for SSH access"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for the bastion host"
  type        = string
}

variable "db_name" {
  description = "Name of the database"
  type        = string

}
variable "db_username" {
  description = "Username for the database"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "Password for the database"
  type        = string
  sensitive   = true
}

variable "bastion_sg_id" {
  description = "Security group ID for the bastion host"
  type        = string
  default     = null
}
