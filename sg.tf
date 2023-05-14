module "security-groups" {
  source = "../security-module"
  vpc_id = local.vpc_id
  security_desc = var.rds_security_desc
  security_group_name = var.rds_security_group_name
  tags = var.tags
  ingress-cidr = var.ingress-cidr
}