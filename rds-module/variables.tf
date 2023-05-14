variable "identifier" {}
variable "allocated-storage" {}
variable "db-name" {}
variable "tags" {}
variable "engine" {}
variable "engine-version" {}
variable "username" {}
variable "instance-class" {}
variable "db-subnet-group-name" {}
variable "vpc_security_group_ids" {}
variable "secret-name" {}
variable "rds-tags" {
  default = {}
}
