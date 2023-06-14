data "aws_availability_zones" "available" {
  state = "available"
}
resource "aws_instance" "main" {
  ami = var.ami
  # instance_type               = var.instance_type
  subnet_id                   = var.subnet_public_id //Associate with public subnet
  associate_public_ip_address = true
  vpc_security_group_ids = [var.vpc_security_group_ids]   //Associate with security group
  key_name               = aws_key_pair.generated_key.key_name
  tags   = merge(
    { "Name" = var.ec2_name },
    var.tags,
  )
}
