data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_rds_cluster" "create_cluster"{
  database_name           = "${var.database_name}"
  master_username         = "${var.master_username}"
  master_password         = "${var.master_password}"
  backup_retention_period = "${var.backup_retention_period}"
  preferred_backup_window = "${var.preferred_backup_window}"
  engine = "${var.engine}"
  engine_mode = "${var.engine_mode}"
  engine_version = "${var.engine_version}"
  skip_final_snapshot= "${var.skip_final_snapshot}"
  db_subnet_group_name="${var.db_subnet_group_name}"
  vpc_security_group_ids=["${var.vpc_security_group_ids}"]
  db_cluster_parameter_group_name="${var.db_cluster_parameter_group_name}"
  timeouts {
    create = "${var.to_create}"
    update = "${var.to_update}"
    delete = "${var.to_delete}"
  }
  enable_http_endpoint = "${var.enable_http_endpoint}"
}