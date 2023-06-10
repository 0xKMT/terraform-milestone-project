data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_vpc" "main" {
  cidr_block       = "200.200.0.0/16"
  instance_tenancy = "default"
  tags = {
    "Name":	"pkmtri-tf-vpc-apache-superset"
    "Owner": "PKMTri"
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
    "Name": "pkmtri-tf-private-subnet-${count.index}"
    "Owner": "PKMTri"
    "Project": "terraform-apache-superset"
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
    "Name": "pkmtri-tf-public-subnet-${count.index}"
    "Owner": "PKMTri"
    "Project": "terraform-apache-superset"
  }
}

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.main.id
  tags = {
    "Name": "pkmtri-tf-internet-gw-apache-superset"
    "Owner": "PKMTri"
    "Project": "terraform-apache-superset"
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
    "Name": "pktmri-tf-public-route-table"
    "Owner": "PKMTri"
    "Project": "terraform-apache-superset"
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
    "Name": "pkmtri-tf-private_route_table"
    "Owner": "PKMTri"
    "Project": "terraform-apache-superset"
  }
}

resource "aws_route_table_association" "private_route_table" {
  count          = length(data.aws_availability_zones.available.names)
  subnet_id      = aws_subnet.private-subnet[count.index].id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_security_group" "web_ssh_ping" {
  name   = "web_ssh_ping"
  vpc_id = aws_vpc.main.id

  ingress { //ICMP Ping
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress { //SSH
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress { //HTTP
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress { //Allow all outbound ports
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "ec2_connect_rds" {
  ami           = "ami-0df7a207adb9748c7"
  instance_type = "t2.micro"
  key_name      = "tst-apachesuperset"

  //Associate with public subnet
  subnet_id                   = aws_subnet.public-subnet[0].id
  associate_public_ip_address = true
  //security_groups = ["web_ssh_ping"]
  vpc_security_group_ids = [aws_security_group.web_ssh_ping.id]
  tags = {
    "Name": "pkmtri-tf-ec2_rds"
    "Owner": "PKMTri"
    "Project": "terraform-apache-superset"
  }
}
locals {
  instance_ip = aws_instance.ec2_connect_rds.public_ip
}
