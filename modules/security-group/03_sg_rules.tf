resource "aws_security_group_rule" "ingress_rules" {
  count       = length(var.ingress_ports)  //Dùng biến đếm count để duyệt qua từng phần tử port
  type        = "ingress"
  from_port   = var.ingress_ports[count.index].port
  to_port     = var.ingress_ports[count.index].port
  protocol    = var.ingress_protocol
  cidr_blocks = ["${var.ingress_cidr}"]
  description = var.ingress_ports[count.index].description
  security_group_id = aws_security_group.security_group.id
}

resource "aws_security_group_rule" "egress_rules" {
  count       = length(var.egress_ports)  
  type        = "egress"
  from_port   = var.egress_ports[count.index].port
  to_port     = var.egress_ports[count.index].port
  protocol    = var.egress_protocol
  cidr_blocks = ["${var.egress_cidr}"]
  description = var.egress_ports[count.index].description
  security_group_id = aws_security_group.security_group.id
}