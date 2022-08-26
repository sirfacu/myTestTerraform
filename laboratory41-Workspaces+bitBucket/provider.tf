provider "aws" {
  region  = lookup(var.deployRegion,terraform.workspace)
  profile = "sirfacu"
}