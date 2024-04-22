# Private subnets 1

resource "aws_subnet" "private-app-subnet-1" {
    vpc_id = "aws_vpc.fdm-vpc.id"
    cidr_block = var.private-app-subnet-1-cidr
    availability_zone = "eu-west-2a"

    tags = {
        Name = "fdm-private-app-subnet-1 | App Tier "
    }

  
}

resource "aws_subnet" "private-app-subnet-2" {
    vpc_id = "aws_vpc.fdm-vpc.id"
    cidr_block = var.private-app-subnet-2-cidr
    availability_zone = "eu-west-2a"

    tags = {
        Name = "fdm-private-app-subnet-2 | App Tier "
    }

  
}


# Database Private Subnet

resource "aws_subnet" "private-db-subnet-1" {

    vpc_id = "aws_vpc.fdm-vpc.id"
    cidr_block = var.private-db-subnet-1-cidr
    availability_zone = "eu-west-2a"
    map_public_ip_on_launch = false

    tags = {
        Name = "fdm-private-db-subnet-1 | DB Tier "
    }
  
}

# Database Private Subnet 2

resource "aws_subnet" "private-db-subnet-2" {

    vpc_id = "aws_vpc.fdm-vpc.id"
    cidr_block = var.private-db-subnet-2-cidr
    availability_zone = "eu-west-2b"
    map_public_ip_on_launch = false

    tags = {
        Name = "fdm-private-db-subnet-2 | DB Tier "
    }
  
}
