variable "region" {
  description = "The AWS region to deploy resources in"
  type        = string

}
variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}
variable "public_subnet_1" {
  description = "ID of the first public subnet"
  type        = string
}

variable "instance_type" {
  description = "Instance type for the database"
  type        = string
}

variable "key_name" {
  description = "Name of the key pair for SSH access"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for the bastion host"
  type        = string
}

variable "availability_zone_1" {
  description = "Availability zone for the first public subnet"
  type        = string
}
