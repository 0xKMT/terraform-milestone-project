output "vpc_id" {
  description = "ID of VPC"
  value       = aws_vpc.main.id
}

output "private_subnet_id" {
  description = "ID of Private Subnet"
  value       = "${aws_subnet.private.*.id}"
}

output "public_subnet_id" {
  description = "ID of Public Subnet"
  value       = "${aws_subnet.public.*.id}"
}

output "internet_gateway_id" {
  description = "ID of internet gateway"
  value       = "${aws_internet_gateway.ig.*.id}"
}

output "private_route_table" {
  description = "ID of private route table"
  value       = "${aws_route_table.private.*.id}"
}

output "public_route_table" {
  description = "ID of public route table"
  value       = "${aws_route_table.public.*.id}"
}
