output "vpc_apache_superset" {
  description = "outputs of vpc"
  value       = module.vpc_apache_superset.vpc_id
}

output "security_group_rds_id" {
  description = "outputs of security group rds"
  value       = module.security_group_rds
}

output "security_group_ec2_id" {
  description = "outputs of security group ec2"
  value       = module.security_group_ec2
}


