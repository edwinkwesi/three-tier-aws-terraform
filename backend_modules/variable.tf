# Variable CIDR Block

variable "vpc_cidr" {
    default = "10.0.0.0/16"
    description = "CIDR Block for FDM VPC"
    type = string
}


# Web Tier Cidr Block

variable "public-web-subnet-1-cidr" {
    default = "10.0.1.0/24"
    description = "CIDR Block for FDM Web Tier"
    type = string
}

variable "public-web-subnet-2-cidr" {
    default = "10.0.2.0/24"
    description = "CIDR Block for FDM Web Tier 2"
    type = string
}

variable "private-app-subnet-1-cidr" {
    default = "10.0.3.0/24"
    description = "CIDR Block for FDM Private App Tier1"
    type = string

  
}

variable "private-app-subnet-2-cidr" {
    default = "10.0.4.0/24"
    description = "CIDR Block for FDM Private App Tier2"
    type = string

  
}

variable "priave-db-subnet-1-cidr" {
    default = "10.0.5.0/24"
    description = "CIDR Block for FDM Private DB Tier1"
    type = string

}

variable "priave-db-subnet-2-cidr" {
    default = "10.0.6.0/24"
    description = "CIDR Block for FDM Private DB Tier2"
    type = string

}

# Variable for security group

variable "ssh-locate"{
    default = "0.0.0.0/0"
    description = "Remote IP"
    type = string
}


variable "db-instance-class" {
    default = "db.t2.micro"
    description = "AWS EC2 DB Instance Class"
    type = string
  
}

variable "multi-az-deployment" {
    default = "true"
    description = "High Availability AZ"
    type = bool
  
}

