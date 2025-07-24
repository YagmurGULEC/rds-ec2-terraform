output "vpc_name" {
  description = "Name of the VPC"
  value       = module.network.vpc_name
}

output "vpc_id" {
  description = "ID of the VPC"
  value       = module.network.vpc_id
}



output "bastion_public_ip" {
  value = module.bastion.bastion_public_ip
}
output "instance_public_dns" {
  description = "Public DNS of the bastion EC2 instance"
  value       = module.bastion.instance_public_dns
}
output "bastion_sg_id" {
  value = module.bastion.bastion_sg_id
}

output "db_endpoint" {
  description = "Endpoint of the RDS database"
  value       = module.rds.db_endpoint
}
output "rds_db_name" {
  description = "Name of the RDS database"
  value       = module.rds.rds_db_name
}
