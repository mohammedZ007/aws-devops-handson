terraform {
  backend "s3" {
    bucket       = "crecita-terraform-state-459969247850"
    key          = "terraform.tfstate"
    region       = "ap-south-1"
    use_lockfile = true
  }
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  required_version = ">= 1.5.0"
}

provider "aws" {
  region = var.aws_region
}