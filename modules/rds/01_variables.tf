variable "db_subnet_group_name" {
    description = "database subnet group name"
    type = string
    default = ""
}

variable "private_subnet_ids" {
  description = "private subnet ids"
#   type = string
#   default = ""
}
variable "allocated_storage" {
    description = "allocated storage"
    type = number
    default = 10
}

variable "database_name" {
    description = "rds database name"
    type = string
    default = ""
}

variable "engine" {
    description = "engine"
    type = string
    default = ""
}

variable "engine_version" {
    description = "engine version"
    type = string
    default = ""
}

variable "instance_class" {
    description = "instance class"
    type = string
    default = ""
}

variable "rds_username" {
    description = "username log in rds"
    type = string
}

variable "rds_password" {
    description = "password log in rds"
    type = string
}

variable "skip_final_snapshot" {
    description = "skip final snapshot"
    type = bool
    default = true
}

variable "vpc_security_group_ids" {
    description = "skip final snapshot"
}

variable "availability_zone" {
    description = "availability zone "
    type = string
    default = ""
}

variable "rds_name" {
    description = "rds db name"
    type = string
    default = ""
}

variable "tags" {
    description = "tags for manage project"
    type = map
    default = {}
}