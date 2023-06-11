data "aws_availability_zones" "available" {
  state = "available"
}

#create simple vpc
resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = var.instance_tenancy
  tags = merge(
    { "Name" = var.vpc_name },
    var.tags,
  )
}

resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.main.id
  tags   = var.tags
}

#Create public-subnet
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "${var.network_ip}.10.0/24"
  availability_zone       = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = true
  tags = merge(
    { "Name" = var.public_subnet_name },
    var.tags,
  )
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0" # Traffic from Public Subnet reaches Internet via Internet Gateway
    gateway_id = aws_internet_gateway.ig.id
  }
  route {
    ipv6_cidr_block = "::/0"
    gateway_id      = aws_internet_gateway.ig.id
  }
  tags = merge(
    { "Name" = var.public_rtb_name },
    var.tags,
  )
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

#Create private-subnet 
resource "aws_subnet" "private" {
  count                   = length(data.aws_availability_zones.available.names)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "${var.network_ip}.${20 + count.index}.0/24"
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = false  # Privat subnet
  tags = merge(
    { "Name" = "${var.private_subnet_name}-${count.index}"},
    var.tags,
  )
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id
  tags = merge(
    { "Name" = var.private_rtb_name },
    var.tags,
  )
}

resource "aws_route_table_association" "private" {
  count          = length(data.aws_availability_zones.available.names)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private.id
}


