# FDM Public subnet

resource "aws_subnet" "public-web-subnet-1-cidr" {
    vpc_id          = "var.fd-vpc.id"
    cidr_block      = var.public-web-subnet-1-cidr
    availability_zone = "eu-west-2a"
    map_public_ip_on_launch = "true"

    tags = {
        Name = "fdm-pubnet-1"
    }
}
  
resource "aws_subnet" "public-web-subnet-2-cidr" {
    vpc_id          = "var.fdm-vpc.id"
    cidr_block      = var.public-web-subnet-2-cidr
    availability_zone = "eu-west-2b"
    map_public_ip_on_launch = "true"

    tags = {
        Name = "fdm-pubnet-2"
    }
}
  
