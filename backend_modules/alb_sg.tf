# SG Presentation  LB 

resource "aws_security_group" "alb-security-group" {
    name = "ALB Security Group"
    description = "Enable http/https access on port 80/443"
    vpc_id = aws_vpc.fdm-vpc.id

    ingress {
        description = "http access"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "https access"
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "ALB Security Group"
    }
}



# SG Application Tier (Bastion Host)

resource "aws_security_group" "ssh-scurity-group" {
    name = "SSH Security Group"
    description = "Enable ssh access on port 22"
    vpc_id = aws_vpc.fdm-vpc.id

    ingress {
        description = "ssh access"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["${var.ssh-locate}"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "SSH Security Group"
    }
}
  

