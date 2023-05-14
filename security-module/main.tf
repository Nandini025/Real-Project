resource "aws_security_group" "security" {
  name = var.security_group_name
  description = var.security_desc
  vpc_id = var.vpc_id
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = merge(var.tags, var.security_group_tags, {"Name"= var.security_group_name})
}
# this will add ingress rules to the security groups
resource "aws_security_group_rule" "ingress_rule" {
  count = length(var.ingress-cidr)
  type = "ingress"
  from_port         = lookup(var.ingress-cidr[count.index],"from_port" )
  to_port           = lookup(var.ingress-cidr[count.index],"to_port" )
  protocol          = "6" # custom TCP
  cidr_blocks       =[lookup(var.ingress-cidr[count.index],"cidr_block" )]
  security_group_id = aws_security_group.security.id
  description = lookup(var.ingress-cidr[count.index],"description" )
}












