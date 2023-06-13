output "vpc_apache_superset" {
  description = "outputs of vpc"
  value       = module.vpc_apache_superset.vpc_id
}

output "public_subnet_apache_superset_id" {
  description = "outputs of public subnets"
  value       = module.vpc_apache_superset.public_subnet_id
}

output "private_subne_apache_superset_id" {
  description = "outputs of private subnets"
  value       = module.vpc_apache_superset.private_subnet_id
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
  description = "outputs of EC2 apache superset"
  value       = module.create_EC2_apache_superset
}

output "RDS_apache_superset"  {
  description = "outputs of RDS apache superset" 
  value       = module.RDS_apache_superset.rds_instance_address
}

