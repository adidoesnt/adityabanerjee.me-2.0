# VPC for Directus
resource "aws_vpc" "abme_directus_vpc" {
    cidr_block = "10.0.0.0/16"
    enable_dns_hostnames = true
    enable_dns_support = true

    tags = {
        Name = "abme_directus_vpc"
    }
}

# IGW for public subnets
resource "aws_internet_gateway" "abme_directus_igw" {
    vpc_id = aws_vpc.abme_directus_vpc.id

    tags = {
        Name = "abme_directus_igw"
    }
}

# Public subnets (2 for balance between reliability and cost)
resource "aws_subnet" "abme_directus_public_subnet_1" {
    vpc_id = aws_vpc.abme_directus_vpc.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "eu-west-2a"
    map_public_ip_on_launch = true # Automatically assign public IPs for resources that need to be publicly accessible

    tags = {
        Name = "abme_directus_public_subnet_1"
    }
}

resource "aws_subnet" "abme_directus_public_subnet_2" {
    vpc_id = aws_vpc.abme_directus_vpc.id
    cidr_block = "10.0.2.0/24"
    availability_zone = "eu-west-2b"
    map_public_ip_on_launch = true

    tags = {
        Name = "abme_directus_public_subnet_2"
    }
}

# Public route table
resource "aws_route_table" "abme_directus_public_route_table" {
    vpc_id = aws_vpc.abme_directus_vpc.id

    # Route all outbound traffic to the internet gateway
    route {
        cidr_block = "0.0.0.0/0" # All external traffic
        gateway_id = aws_internet_gateway.abme_directus_igw.id # Route to IGW
    }

    tags = {
        Name = "abme_directus_public_route_table"
    }
}

# Public route table association
resource "aws_route_table_association" "abme_directus_public_route_table_association_1" {
    subnet_id = aws_subnet.abme_directus_public_subnet_1.id
    route_table_id = aws_route_table.abme_directus_public_route_table.id
}

resource "aws_route_table_association" "abme_directus_public_route_table_association_2" {
    subnet_id = aws_subnet.abme_directus_public_subnet_2.id
    route_table_id = aws_route_table.abme_directus_public_route_table.id
}


# NAT Gateway for private subnets
resource "aws_eip" "abme_directus_nat_eip" {
    domain = "vpc"
}

resource "aws_nat_gateway" "abme_directus_nat_gateway" {
    allocation_id = aws_eip.abme_directus_nat_eip.id
    subnet_id = aws_subnet.abme_directus_public_subnet_1.id

    tags = {
        Name = "abme_directus_nat_gateway"
    }
}

# Private subnets (2 for balance between reliability and cost)
resource "aws_subnet" "abme_directus_private_subnet_1" {
    vpc_id = aws_vpc.abme_directus_vpc.id
    cidr_block = "10.0.3.0/24"
    availability_zone = "eu-west-2a"

    tags = {
        Name = "abme_directus_private_subnet_1"
    }
}

resource "aws_subnet" "abme_directus_private_subnet_2" {
    vpc_id = aws_vpc.abme_directus_vpc.id
    cidr_block = "10.0.4.0/24"
    availability_zone = "eu-west-2b"

    tags = {
        Name = "abme_directus_private_subnet_2"
    }
}

# Private route table
resource "aws_route_table" "abme_directus_private_route_table" {
    vpc_id = aws_vpc.abme_directus_vpc.id

    # Route all outbound traffic to the NAT gateway
    route {
        cidr_block = "0.0.0.0/0" # All external traffic
        nat_gateway_id = aws_nat_gateway.abme_directus_nat_gateway.id # Route to NAT Gateway
    }

    tags = {
        Name = "abme_directus_private_route_table"
    }
}

# Private route table association
resource "aws_route_table_association" "abme_directus_private_route_table_association_1" {
    subnet_id = aws_subnet.abme_directus_private_subnet_1.id
    route_table_id = aws_route_table.abme_directus_private_route_table.id
}

resource "aws_route_table_association" "abme_directus_private_route_table_association_2" {
    subnet_id = aws_subnet.abme_directus_private_subnet_2.id
    route_table_id = aws_route_table.abme_directus_private_route_table.id
}
