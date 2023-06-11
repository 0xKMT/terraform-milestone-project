data "aws_availability_zones" "available" {
  state = "available"
}

module "vpc_apache_superset" {
  source     = "./modules/vpc"
  vpc_cidr   = var.network_vpc
  vpc_name   = var.vpc_name
  network_ip = var.network_ip
  public_subnet_name  = var.public_subnet_name
  public_subnet_cidr  = var.public_subnet_cidr
  public_rtb_name     = var.public_rtb_name
  private_subnet_name = var.private_subnet_name
  private_rtb_name    = var.private_rtb_name
  tags = var.tags
}

module "security_group_ec2" {
  source = "./modules/security-group"
  sg_name = var.sg_name_ec2
  vpc_id = module.vpc_apache_superset.vpc_id
  ingress_ports = var.ingress_ports_ec2
  ingress_cidr  = var.ingress_cidr_ec2
  ingress_protocol = var.ingress_protocol_ec2
  egress_cidr      = var.egress_cidr_ec2
  egress_ports     = var.egress_ports_ec2
  egress_protocol  = var.egress_protocol_ec2
  tags    = var.tags
}

module "security_group_rds" {
  source = "./modules/security-group"
  sg_name = var.sg_name_rds
  vpc_id = module.vpc_apache_superset.vpc_id
  ingress_ports = var.ingress_ports_rds
  ingress_cidr  = var.ingress_cidr_rds
  ingress_protocol = var.ingress_protocol_rds
  egress_cidr   = var.egress_cidr_rds
  egress_ports  = var.egress_ports_rds
  egress_protocol = var.egress_protocol_rds
  tags    = var.tags
}

# resource "aws_instance" "ec2_connect_rds" {
#   ami           = "ami-0df7a207adb9748c7"
#   instance_type = "t2.micro"
#   key_name      = "tst-apachesuperset"

#   //Associate with public subnet
#   subnet_id                   = aws_subnet.public-subnet[0].id
#   associate_public_ip_address = true
#   //security_groups = ["web_ssh_ping"]
#   vpc_security_group_ids = [aws_security_group.web_ssh_ping.id]
#   tags = {
#     "Name": "pkmtri-tf-ec2_rds"
#     "Owner": "PKMTri"
#     "Project": "terraform-apache-superset"
#   }
# }
# locals {
#   instance_ip = aws_instance.ec2_connect_rds.public_ip
# }
