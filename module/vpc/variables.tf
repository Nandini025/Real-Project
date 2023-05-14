variable "cidr" {
  type = string # we are not providing user must provide this
}

variable "tags" { # user must provide this
  type = map(string) # these are common tags which will be used for all resources in this module
}

variable "VPC_tags" {
  type = map(string)# optional
  default = {}
}
variable "az" {
  type = list(string)
}
variable "public_cidr" {
  type = list(string)
}
variable "private_cidr" {
  type = list(string)
}
variable "subnet_tags" {
  type = map(string) # opional
  default = {}
}
variable "public_subnet_names" {
  type = list(string)
}
variable "private_subnet_names" {
  type = list(string)
}
variable "igw_tags" {
  type = map(string)
  default = {} # Optional
}
variable "route_tags" {
  type = map(string) # optional
  default = {}
}
variable "public_route_names" {
  type = list(string) # user must provide this
}
variable "private_route_names" {
  type = list(string) # user must provide this
}
variable "private_subnet_tags" {
  type = map(string)
  default = {} # Optional
}
variable "nat_tags" {
  type = map(string)
  default = {} # Optional
}
variable "p_route_tags" {
  type = map(string)
  default = {} # Optional
}
variable "database_public_cidr" {
  type = list(string)
}
variable "database_tags" {
  type = map(string)
  default = {} # Optional
}
variable "database_subnet_names" {
  type = list(string) # user must provide this
}
variable "database_route_tags" {
  type =map(string) # optional
  default = {}
}
variable "database_route_names" {
  type = list(string) # user should provide this
}
variable "database_subnet_tags" {
  type =map(string) # optional
  default = {}
}





































