variable "vpc_name" {
  description = "vpc's name"
  type        = string
  default     = ""
}

variable "vpc_cidr" {
  description = "network of vpc"
  type        = string
  default     = ""
}

variable "instance_tenancy" {
  description = "instance_tenancy"
  type        = string
  default     = "default"
}

variable "public_subnet_name" {
  description = "public subnet's name"
  type        = string
  default     = ""
}

variable "public_subnet_cidr" {
  description = "public subnet"
  type        = string
  default     = ""
}

variable "public_rtb_name" {
  description = "public route table name"
  type        = string
  default     = ""
}

variable "private_subnet_name" {
  description = "private subnet's name"
  type        = string
  default     = ""
}

variable "network_ip" {
  description = "ip section network"
  type        = string
  default     = ""
}

variable "private_rtb_name" {
  description = "private route table name"
  type        = string
  default     = ""
}

variable "tags" {
  description = "tags for manage project"
  type        = map
  default     = {}
}
