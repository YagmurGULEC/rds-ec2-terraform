output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.main.id
}
output "vpc_name" {
  description = "Name of the VPC"
  value       = aws_vpc.main.tags["Name"]
}
output "public_subnet_id" {
  description = "ID of the public subnet"
  value       = aws_subnet.public.id
}

output "private_subnet_id_1" {
  description = "ID of the first private subnet"
  value       = aws_subnet.private_1.id
}

output "private_subnet_id_2" {
  description = "ID of the second private subnet"
  value       = aws_subnet.private_2.id
}
