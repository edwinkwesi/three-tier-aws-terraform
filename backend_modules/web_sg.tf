# SG Preentation Tier

resource "aws_security_group" "webserver-security-group" {

    name = "webserver-security-group"
    description = "Enable http/https access on port 80/443 vial ALB and ssh via ssh sg"
    vpc_id = aws_vpc.fdm-vpc.id

    ingress {
        description = "Enable http access on port 80"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["${aws_security_group.alb-security-group.id}"]
  
    }

    ingress {
        description = "https access on port 443"
        from_port = 443
        to_port = 443
        protocol = "tcp"
        security_groups = ["${aws_security_group.alb-security-group.id}"]
    }

    ingress {
        description = "ssh access on port 22"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        security_groups = ["${aws_security_group.alb-security-group.id}"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]

    }

    tags = {
        Name = "Web server Security group"
    }
}