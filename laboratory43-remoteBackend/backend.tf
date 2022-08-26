terraform {
  backend "s3" {
    bucket = "sirfacu-terraform-bucket"
    key = "tfstates-files/dev/terraform.tfstate"
    region = "us-east-1"
    profile = "sirfacu"
  }
}