terraform {
  cloud {
    organization = "edwinkwesi"

    workspaces {
      name = "three-tier-arch"
    }
  }
  required_providers {
    aws = {
      version = "~> 5.0.0"
    }
  }
}

provider "aws" {
  region = "eu-west-2"
  shared_credentials_files = ["~/.aws/credentials"]

}

module "backend_modules" {
  source = "./backend_modules"

  
}


