variable "security_group_name" {
  type = string # user must provide this
}
variable "security_desc" {
  type = string # user must provide this
}
variable "tags" {
  type = map(string) # user must provide this
}
variable "security_group_tags" {
  type = map(string)
  default = {} # optional
}
variable "vpc_id" {
  type = map(string) # user must provide this
}
variable "ingress-cidr" {
  type = list(map(string))
  default = [
  ]
}