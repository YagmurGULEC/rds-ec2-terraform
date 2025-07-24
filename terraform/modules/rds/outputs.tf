
output "db_endpoint" {
  description = "Endpoint of the RDS database"
  value       = aws_db_instance.mysql.endpoint
}

output "rds_db_name" {
  value = aws_db_instance.mysql.db_name
}
