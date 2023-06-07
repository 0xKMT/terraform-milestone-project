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