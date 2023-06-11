##Create Security Group
resource "aws_security_group" "security_group" {
  name   = var.sg_name
  description = var.sg_description
  vpc_id = var.vpc_id
  tags   = merge(
    { "Name" = var.sg_name },
    var.tags,
  )
} 



