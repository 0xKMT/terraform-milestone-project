output "rds_db_subnet_group_id" {
  value = aws_db_subnet_group.rds_subnet_group.id
}
output "rds_instance_address" {
  value = aws_db_instance.default.address
}

