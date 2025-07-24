
variable "region" {
  description = "AWS region"
  type        = string

}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string

}
variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string

}
variable "private_subnet_cidr_1" {
  description = "CIDR block for the private subnet"
  type        = string

}
variable "private_subnet_cidr_2" {
  description = "CIDR block for the second private subnet"
  type        = string

}

variable "availability_zone_1" {
  description = "Availability zone for the first private subnet"
  type        = string

}
variable "availability_zone_2" {
  description = "Availability zone for the second private subnet"
  type        = string

}
variable "project_name" {
  description = "Name of the project"
  type        = string
}
