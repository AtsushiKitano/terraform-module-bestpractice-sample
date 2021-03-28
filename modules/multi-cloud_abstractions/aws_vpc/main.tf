locals {
  subnet_ids = [
    for v in var.subnets : aws_subnet.main[v.name].id
  ]
}

resource "aws_vpc" "main" {
  cidr_block = var.vpc.cidr
  tags = {
    Name = var.vpc.name
  }
}

resource "aws_subnet" "main" {
  for_each = { for v in var.subnets : v.name => v }

  vpc_id            = aws_vpc.main.id
  availability_zone = each.value.location
  cidr_block        = each.value.cidr
  tags = {
    Name = each.value.name
  }
}
