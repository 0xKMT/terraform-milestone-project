data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_vpc" "main" {
  cidr_block       = "200.200.0.0/16"
  instance_tenancy = "default"
  tags = {
    "Name":	"vpc-tf-apache-superset"
    "Owner": "PKMTri Check Create resources"
    "Project": "terraform-apache-superset"
  }
}

#Create private-subnet 
resource "aws_subnet" "private-subnet" {
  count                   = length(data.aws_availability_zones.available.names)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "200.200.${20 + count.index}.0/24"
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = false  # Privat subnet
  tags = {
    Name = "pkmtri-private-subnet-${count.index}"
  }
}

#Create public-subnet
resource "aws_subnet" "public-subnet" {
  count                   = length(data.aws_availability_zones.available.names)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "200.200.${10 + count.index}.0/24"
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name = "pkmtri-public-subnet-${count.index}"
  }
}

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "terraform-internet-gw-apache-superset"
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0" # Traffic from Public Subnet reaches Internet via Internet Gateway
    gateway_id = aws_internet_gateway.internet_gateway.id
  }
  route {
    ipv6_cidr_block        = "::/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }
  tags = {
    Name = "terraform-public-route-table"
  }
}

resource "aws_route_table_association" "public_route_table" {
  count          = length(data.aws_availability_zones.available.names)
  subnet_id      = aws_subnet.public-subnet[count.index].id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "terraform-private_route_table"
  }
}

resource "aws_route_table_association" "private_route_table" {
  count          = length(data.aws_availability_zones.available.names)
  subnet_id      = aws_subnet.private-subnet[count.index].id
  route_table_id = aws_route_table.private_route_table.id
}