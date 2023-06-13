locals {
  instance_ip = aws_instance.main.public_ip
}
output "ssh_command" {
  value = "ssh -i '${var.keyname}.pem' ubuntu@${local.instance_ip}"
}