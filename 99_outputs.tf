output "vpc_apache_superset" {
  description = "outputs of vpc"
  value       = module.vpc_apache_superset.vpc_id
}

output "security_group_rds" {
  description = "outputs of security group rds"
  value       = module.security_group_rds
}

output "security_group_ec2" {
  description = "outputs of security group ec2"
  value       = module.security_group_ec2
}

output "create_EC2_apache_superset" {
  description = "outputs of security group ec2"
  value       = module.create_EC2_apache_superset
}

