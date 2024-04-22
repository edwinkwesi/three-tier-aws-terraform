# Route Table

resource "aws_route_table" "public-route-table" {

    vpc_id = "${aws_vpc.fdm-vpc}"

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.fdm_igw.id}"
    }

    tags =  {
        Name = "public-route-table"
    }
  
}

# Route Table association

resource "aws_route_table_association" "public-subnet-1-route-table-association" {

    subnet_id = aws_subnet.public-web-subnet-1-cidr.id
    route_table_id = aws_route_table.public-route-table.id

}