resource "aws_db_instance" "DB" {
  identifier = var.identifier
  allocated_storage    = var.allocated-storage
  db_name              = var.db-name
  engine               = var.engine
  #engine_version_actual = var.engine-version
  instance_class       = var.instance-class
  username             = var.username
  password             = random_password.r-password.result
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  db_subnet_group_name = var.db-subnet-group-name
  vpc_security_group_ids = var.vpc_security_group_ids
  tags = merge(var.tags,var.rds-tags)
}
resource "random_password" "r-password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}
# store password in secret manager
resource "aws_secretsmanager_secret" "rds" {
  name = var.secret-name
  tags = merge(var.tags,var.rds-tags)
}
resource "aws_secretsmanager_secret_version" "rds-version" {
  secret_id     = aws_secretsmanager_secret.rds.id
  secret_string = random_password.r-password.result
  tags = merge(var.tags,var.rds-tags)
}