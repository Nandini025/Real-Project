module "rds" {
  source = "../rds-module"
  allocated-storage = var.allocated-storage
  db-name = var.db-name
  db-subnet-group-name = local.db-subnet-group-name
  engine = var.engine
  engine-version = var.engine-version
  identifier = var.identifier
  instance-class = var.instance-class
  secret-name = var.secret-name
  tags = var.tags
  username = var.username
  vpc_security_group_ids = local.security-id
  rds-tags = var.rds-tags
}