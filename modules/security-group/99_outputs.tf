output "ingress_rules_simple" {
  value = [for i, v in aws_security_group_rule.ingress_rules : {desc = v.description, port = v.from_port}]
}

output "egress_rules_simple" {
  value = [for m, n in aws_security_group_rule.egress_rules : {desc = n.description, port = n.from_port}]
}