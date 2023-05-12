resource "aws_vpc" "main" { # VPC creation
  cidr_block       = var.cidr
  tags = merge(var.tags, var.VPC_tags)
}
# public subnet creation
resource "aws_subnet" "subnet" {
  count = length(var.public_cidr)
  availability_zone = var.az[count.index]
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_cidr[count.index]
  tags = merge(var.tags,
    var.subnet_tags
    {"Name" = var.public_subnet_names[count.index]}) # unique name for each subnet
}
# Internet Gateway
resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.main.id
  tags = merge(var.tags, var.igw_tags)
}
# Route Table
resource "aws_route_table" "Route" {
  vpc_id = aws_vpc.main.id
  tags = merge(var.tags, var.route_tags
    {"Name" = var.public_route_names[count.index]})
}
# add Route
resource "aws_route" "public" {
  route_table_id            = aws_route_table.Route.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.IGW.id
}
# subnet association we have one route table we need to add 2 subnets to this
resource "aws_route_table_association" "associations" {
  count = length(var.public_cidr)
  subnet_id      = element(aws_subnet.subnet[*].id,count.index )
  route_table_id = aws_route_table.Route.id
}
# Private subnet creation
resource "aws_subnet" "private_subnet" {
  count = length(var.private_cidr)
  availability_zone = var.az[count.index]
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_cidr[count.index]
  tags = merge(var.tags,
    var.private_subnet_tags
    {"Name" = var.private_subnet_names[count.index]}) # unique name for each subnet
}
#elastic Ip
resource "aws_eip" "eip" {}
#NAT Gateway
resource "aws_nat_gateway" "NAT" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.subnet[0].id
  tags = merge(var.tags, var.nat_tags)

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.IGW]
}
#Private Route table
resource "aws_route_table" "P_Route" {
  vpc_id = aws_vpc.main.id
  tags = merge(var.tags, var.p_route_tags
    {"Name" = var.private_route_names[count.index]})
}
#add Nat gateway
resource "aws_route" "private" {
  route_table_id            = aws_route_table.P_Route.id
  destination_cidr_block    = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.NAT.id
}
#subnet associations
resource "aws_route_table_association" "private-associations" {
  count = length(var.private_cidr)
  subnet_id      = element(aws_subnet.private_subnet[*].id,count.index )
  route_table_id = aws_route_table.P_Route.id
}
#database subnet creation
resource "aws_subnet" "database_subnet" {
  count = length(var.database_public_cidr)
  availability_zone = var.az[count.index]
  vpc_id     = aws_vpc.main.id
  cidr_block = var.database_public_cidr[count.index]
  tags = merge(var.tags,
    var.database_tags
    {"Name" = var.database_subnet_names[count.index]}) # unique name for each subnet
}
# Route Table
resource "aws_route_table" "database-route" {
  vpc_id = aws_vpc.main.id
  tags = merge(var.tags, var.database_route_tags
    {"Name" = var.database_route_names[count.index]})
}
# add Route
resource "aws_route" "database-public" {
  route_table_id            = aws_route_table.database-route.id
  destination_cidr_block    = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.NAT.id
}
# subnet association we have one route table we need to add 2 subnets to this
resource "aws_route_table_association" "database_associations" {
  count = length(var.database_public_cidr)
  subnet_id      = element(aws_subnet.database_subnet[*].id,count.index )
  route_table_id = aws_route_table.database-route.id
}
#database subnet group
resource "aws_db_subnet_group" "db_subnet_group" {
  name       = lookup(var.tags,"name" )
  subnet_ids = aws_subnet.database_subnet[*].id
  tags = merge(var.tags,
    var.database_subnet_tags)
}









