terraform {
  backend "s3" {
    bucket = "terraform-labs-sirfacu"
    key    = "lab47/projectA/lab47-A.tfstate"
    region = "us-east-1"
    profile = "sirfacu"
  }
}