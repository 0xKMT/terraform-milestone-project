data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_db_instance" "main" {
  allocated_storage    = var.allocated_storage//20
  db_name              = var.database_name//"mydb"
  engine               = var.engine//"mysql"
  engine_version       = var.engine_version//"5.7"
  instance_class       = var.instance_class//"db.t3.micro"
  username             = var.username//"foo"
  password             = var.password//"foobarbaz"
  parameter_group_name = var.parameter_group_name//"default.mysql5.7"
  skip_final_snapshot  = var.skip_final_snapshot//true
  publicly_accessible  = false
  vpc_security_group_ids = [var.vpc_security_group_ids] //Associate with security group
  availability_zone    =  var.availability_zone 
  tags   = merge(
    { "Name" = var.rds_name },
    var.tags,
  )
}
