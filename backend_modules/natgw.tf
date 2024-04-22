# NAT GW Configuration

resource "aws_eip" "eip_nat" {
    domain = "vpc"

    tags = {
        Name = "EIP  1"
    }
  
}

resource "aws_nat_gateway" "nat_1" {
    allocation_id = "aws_eip.eip_nat.id"
    subnet_id = "aws_subnet.pulic-web-subnet-2.id"

    tags = {
        Name = "NAT Gateway 1"
    }
}
  
