locals {
  public_route_names = format("%s-%s",lookup(var.tags,"Name"),"public")
  private_route_names = format("%s-%s",lookup(var.tags,"Name"),"private")
  database_route_names = format("%s-%s",lookup(var.tags,"Name"),"databse")
}