locals {
  public_route_names = format("%s-%s",lookup(var.tags,"Name"),"public")
  private_route_names = format("%s-%s",lookup(var.tags,"Name"),"private")
  database_route_names = format("%s-%s",lookup(var.tags,"Name"),"database")
  vpc_id = "module.vpc.vpc_id"
  security-id = module.security-groups.security-group
  db-subnet-group-name = "module.vpc.db-subnet-group-name"
}