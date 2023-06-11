variable "region" {
  description = "Default region"
  type        = string
  default     = ""
}

variable "network_vpc" {
  description = ""
  type        = string
  default     = ""
}

variable "vpc_name" {
  description = "name of vpc"
  type        = string
  default     = ""
}

variable "network_ip" {
  description = "ip section network"
  type        = string
  default     = ""
}

variable "public_subnet_name" {
  description = "public subnet name"
  type        = string
  default     = ""
}

variable "public_subnet_cidr" {
  description = "public subnet cidr"
  type        = string
  default     = ""
}

variable "public_rtb_name" {
  description = "public rtb name"
  type        = string
  default     = ""
}

variable "private_subnet_name" {
  description = "private subnet name"
  type        = string
  default     = ""
}

variable "private_rtb_name" {
  description = "private rtb name"
  type        = string
  default     = ""
}

#############################################################################
variable "sg_description"{
  description = "security group name"
  type        = string
  default     = " "
}

variable "sg_name_ec2"{
  description = "security group name"
  type        = string
  default     = ""
}

variable "ingress_cidr_ec2"{
  description = "ingress cidr block"
  type        = string
  default     = ""
}

variable "ingress_protocol_ec2"{
  description = "ingress protocol ec2"
  type        = string
  default     = ""
}

variable "ingress_ports_ec2" {
  type = list(object({
    port   = number
    description = string
  }))
  default = [
  ]
}

variable "egress_cidr_ec2"{
  description = "egress cidr block"
  type        = string
  default     = ""
}

variable "egress_protocol_ec2"{
  description = "egress_protocol"
  type        = string
  default     = ""
}

variable "egress_ports_ec2" {
  type = list(object({
    port   = number
    description = string
  }))
  default = [
  ]
}

###############################################################################

variable "sg_name_rds"{
  description = "security group name"
  type        = string
  default     = ""
}

variable "ingress_cidr_rds"{
  description = "ingress cidr block"
  type        = string
  default     = ""
}

variable "ingress_protocol_rds"{
  description = "egress_protocol"
  type        = string
  default     = ""
}

variable "ingress_ports_rds" {
  type = list(object({
    port   = number
    description = string
  }))
  default = [
  ]
}

variable "egress_cidr_rds"{
  description = "ingress cidr block"
  type        = string
  default     = ""
}

variable "egress_ports_rds" {
  type = list(object({
    port   = number
    description = string
  }))
  default = [
  ]
}

variable "egress_protocol_rds"{
  description = "egress_protocol"
  type        = string
  default     = ""
}

variable "tags" {
  description = "tags to manage"
  type        = map
  default     = {}
}

