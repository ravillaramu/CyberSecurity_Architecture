# create Vpc

resource "aws_vpc" "vpc" {
  cidr_block = var.vpc-cidr
  instance_tenancy = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true

tags = {
    Name = "${var.environment}-vpc"
  }
}


# create  public subnets


resource "aws_subnet" "public_subnet_1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = cidrsubnet("${var.vpc-cidr}", 8, 1)
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.environment}-public-subnet-1"
  }
}


resource "aws_subnet" "public_subnet_2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = cidrsubnet("${var.vpc-cidr}", 8, 2)
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.environment}-public-subnet-2"
  }
}

#create private subnet

resource "aws_subnet" "private_subnet_1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = cidrsubnet("${var.vpc-cidr}", 8, 3)
  tags = {
    Name = "${var.environment}-private-subnet-1"
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = cidrsubnet("${var.vpc-cidr}", 8, 4)

  tags = {
    Name = "${var.environment}-private-Subnet-2"
  }
}



#create internet gateway

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.environment}-igw"
  }
}


#create public route table


resource "aws_route_table" "public_routet_table" {
 
   vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
   tags = {
    Name = "${var.environment}-public_route_table"
  }

}



# create private route table

resource "aws_route_table" "private_routet_table" {
 
   vpc_id = aws_vpc.vpc.id
   tags = {
    Name = "${var.environment}-private_route_table"
  }

}


# subnet assosiation to route tables

resource "aws_route_table_association" "public_subnet_ssosiation" {

  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_routet_table.id
}

resource "aws_route_table_association" "private_subnet_ssosiation" {

  subnet_id      = aws_subnet.private_subnet_1.id
  route_table_id = aws_route_table.private_routet_table.id

}
