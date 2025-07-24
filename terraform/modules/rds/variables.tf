variable "region" {
  description = "The AWS region to deploy resources in"
  type        = string

}

variable "bastion_sg_id" {
  description = "Security group ID for the bastion host"
  type        = string

}

variable "project_name" {
  description = "Name of the project"
  type        = string

}
variable "availability_zone_1" {
  description = "Availability zone for the resources"
  type        = string
}

variable "availability_zone_2" {
  description = "Availability zone for the second resource"
  type        = string
}
variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}
variable "private_subnet_1" {
  description = "CIDR block for the first private subnet"
  type        = string
}
variable "private_subnet_2" {
  description = "CIDR block for the second private subnet"
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

