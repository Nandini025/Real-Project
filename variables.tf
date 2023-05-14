variable "cidr" {
  default = "10.0.0.0/16"# user must provide this
}

variable "tags" { # user must provide this
  default = {
    Name = "timing"
    Environment = "DEV"
    Terraform = "true"
  } # user should give this
}
variable "az" {
  default = ["ap-south-1a","ap-south-1b"]
}
variable "public_cidr" {
  default = ["10.0.1.0/24","10.0.2.0/24"]
}
variable "private_cidr" {
  default = ["10.0.3.0/24","10.0.4.0/24"]
}
variable "public_subnet_names" {
  default = ["subnet-a","subnet-b"]
}
variable "private_subnet_names" {
  default = ["private-subnet-a","private-subnet-b"]
}
variable "database_public_cidr" {
  default = ["10.0.11.0/24","10.0.22.0/24"]
}
variable "database_subnet_names" {
  default = ["database-a","database-b"]
}
variable "rds_security_group_name" {
  default = "timing"
}
variable "rds_security_desc" {
  default = "this is attached to timing rds"
}
variable "ingress-cidr" {
  default = []
}
variable "identifier" {
  default = "timing"
}
variable "allocated-storage" {
  default = "10GB"
}
variable "db-name" {
  default = "timing"
}
variable "engine" {
  default = "postgres"
}
variable "engine-version" {
  default = "14.7-R1"
}
variable "username" {
  default = "timing-admin"
}
variable "instance-class" {
  default = "db.t4g.micro"
}
variable "secret-name" {
  default = "timing-rds-password"
}
variable "rds-tags" {}













