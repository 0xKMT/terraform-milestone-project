variable "ami"{
  description = "Amazon Machine Image"
  type        = string
  default     = ""
}

variable "ec2_name"{
  description = ""
  type        = string
  default     = ""
}

variable "instance_type"{
  description = "vcpu type"
  type        = string
  default     = ""
}

variable "subnet_public_id"{
  description = "ID of the public subnet"
  # type        = string
  # default     = ""
}

variable "vpc_security_group_ids" {
  description = "ID of the Security Group VPC"
  type = string
  default = ""
}

variable "tags" {
  description = "tags for manage project"
  type        = map
  default     = {}
}

variable "keyname" {
  description = "ID of the Security Group VPC"
  type = string
  default = ""
}

