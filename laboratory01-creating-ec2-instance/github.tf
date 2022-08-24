terraform {
  required_providers {
    github = {
      source = "integrations/github" 
      version = "4.27.1"
    }
    aws = {
        source = "hashicorp/aws"
        version = "~> 3.0 " #>=2.10,<=2.30 indicaría cualquier version entre 2.10 y 2.30
    }
  }
}


provider "github" {
  token = "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"
}

#resource "github_repository" "terraform-repository" {
#  name        = "terraform-repository"
#  visibility = "private"
#
#}