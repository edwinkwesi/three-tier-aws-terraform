# Internet Gateway Service

resource "aws_internet_gateway" "fdm_igw" {
    vpc_id = "aws_vpc.fdm_vpc.id"

    tags =  {
        Name = "fdm_igw"
    }

}
 