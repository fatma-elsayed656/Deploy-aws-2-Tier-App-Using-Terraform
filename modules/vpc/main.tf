# Create VPC
resource "aws_vpc" "vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    Name = "${var.project_name}-vpc"
  }
}

# Create internat gateway and attach it to vpc
resource "aws_internet_gateway" "internet_gatway" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.project_name}-igw"
  }
}

# Declare the data source to get all availability zones in region
data "aws_availability_zones" "available_zones" {
  state = "available"
}

#-----------------------------------------------------------------------#

# Create public subnet pub_sub_1a
resource "aws_subnet" "pub_sub_1a" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.pub_sub_1a_cidr
  # attach to the first availability zone in the array
  availability_zone = data.aws_availability_zones.available_zones.names[0]
  map_public_ip_on_launch = true

  tags = {
    Name = "pub_sub_1a"
  }
}

# Create public subnet pub_sub_2b
resource "aws_subnet" "pub_sub_2b" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.pub_sub_2b_cidr
  # attach to the second availability zone in the array
  availability_zone = data.aws_availability_zones.available_zones.names[1]
  map_public_ip_on_launch = true

  tags = {
    Name = "pub_sub_2b"
  }
}

# Create public route table and attach to internet gateway
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gatway.id
  }

  tags = {
    Name = "public-rt"
  }
}

# associate public subnet pub-sub-1a to public route table
resource "aws_route_table_association" "pub_1a_associate" {
  subnet_id      = aws_subnet.pub_sub_1a.id
  route_table_id = aws_route_table.public_route_table.id
}

# associate public subnet pub-sub-2b to public route table
resource "aws_route_table_association" "pub_2b_associate" {
  subnet_id      = aws_subnet.pub_sub_2b.id
  route_table_id = aws_route_table.public_route_table.id
}

#---------------------------------------------------------------------------#

# Create web private subnet pub_sub_3a
resource "aws_subnet" "pri_sub_3a" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.pri_sub_3a_cidr
  availability_zone = data.aws_availability_zones.available_zones.names[0]
  map_public_ip_on_launch = false

  tags = {
    Name = "pri_sub_3a"
  }
}

# Create web private subnet pri_sub_4b
resource "aws_subnet" "pri_sub_4b" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.pri_sub_4b_cidr
  availability_zone = data.aws_availability_zones.available_zones.names[1]
  map_public_ip_on_launch = false

  tags = {
    Name = "pri_sub_4b"
  }
}

# Create primary DB private subnet pri_sub_5a
resource "aws_subnet" "pri_sub_5a" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.pri_sub_5a_cidr
  availability_zone = data.aws_availability_zones.available_zones.names[0]
  map_public_ip_on_launch = false

  tags = {
    Name = "pri_sub_5a"
  }
}

# Create sec DB private subnet pri_sub_6b
resource "aws_subnet" "pri_sub_6b" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.pri_sub_6b_cidr
  availability_zone = data.aws_availability_zones.available_zones.names[1]
  map_public_ip_on_launch = false

  tags = {
    Name = "pri_sub_6b"
  }
}

