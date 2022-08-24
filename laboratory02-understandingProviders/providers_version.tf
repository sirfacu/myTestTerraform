terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 3.0 " #>=2.10,<=2.30 indicaría cualquier version entre 2.10 y 2.30
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
