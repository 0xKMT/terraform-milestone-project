output "vpc_id" {
  description = "ID of VPC"
  value       = "${aws_vpc.main.*.id}"
}

output "private_subnet_id" {
  description = "ID of Private Subnet"
  value       = "${aws_subnet.private-subnet.*.id}"
}

output "public_subnet_id" {
  description = "ID of Public Subnet"
  value       = "${aws_subnet.public-subnet.*.id}"
}

output "internet_gateway_id" {
  description = "ID of internet gateway"
  value       = "${aws_internet_gateway.internet_gateway.*.id}"
}

output "private_route_table" {
  description = "ID of private route table"
  value       = "${aws_route_table.private_route_table.*.id}"
}

output "public_route_table" {
  description = "ID of public route table"
  value       = "${aws_route_table.public_route_table.*.id}"
}

output "ssh_command" {
  value = "ssh -i 'tst-apachesuperset.pem' ec2-user@${local.instance_ip}"
}

output "ec2_sec_gr" {
  value = "aws_security_group.web_ssh_ping.id"
}

