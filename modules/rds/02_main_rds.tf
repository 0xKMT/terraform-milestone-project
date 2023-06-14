data "aws_availability_zones" "available" {
  state = "available"
}
resource "aws_db_subnet_group" "rds_subnet_group" {
  name        = var.db_subnet_group_name
  description = "DB subnet group for RDS"
  subnet_ids  = var.private_subnet_ids //Associate with private subnet
}

// Create a DB instance 
resource "aws_db_instance" "default" {
  identifier           = var.rds_name
  allocated_storage    = var.allocated_storage
  storage_type         = var.storage_type
  db_name              = var.database_name
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  username             = var.rds_username
  password             = var.rds_password
  skip_final_snapshot  = var.skip_final_snapshot
  publicly_accessible  = false
  vpc_security_group_ids = [var.vpc_security_group_ids]
  availability_zone      =  var.availability_zone 
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.id
  tags   = merge(
    { "Name" = var.rds_name },
    var.tags,
  )
}


