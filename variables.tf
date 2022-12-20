variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "aws_profile" {
  type    = string
  default = "default"
}

variable "aws_keypair" {
  type    = string
  default = ("~/.ssh/id_ed25519")
}

variable "wp_rds_db_name" {
  type    = string
  default = "wordpress"
}

variable "wp_rds_db_username" {
  type    = string
  default = "wordpress"
}

variable "wp_rds_db_password" {
  type    = string
  default = "wordpress"
}

variable "wp_rds_engine" {
  type    = string
  default = "mysql"
}

variable "wp_rds_engine_version" {
  type    = string
  default = "5.7"
}

variable "wp_rds_instance_class" {
  type    = string
  default = "db.t3.micro"
}

variable "wp_rds_parameter_group_name" {
  type    = string
  default = "default.mysql5.7"
}

variable "project" {
  type    = string
  default = "wordpress"
}