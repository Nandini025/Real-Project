module "VPC" {
  source = "../module"
  cidr = var.cidr
  tags = var.tags
  private_subnet_names = var.private_subnet_names
  public_subnet_names = var.public_subnet_names
  public_cidr = var.public_cidr
  private_cidr = var.private_cidr
  az = var.az
  public_route_names = local.public_route_names
  private_route_names = local.private_route_names
  database_public_cidr = var.database_public_cidr
  database_subnet_names = var.database_subnet_names
  database_route_names = local.database_route_names
}
