# VPC Configuration for FDM 3Tier

resource "aws_vpc" "fdm_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    Name = "fdm_vpc"
  }
}


