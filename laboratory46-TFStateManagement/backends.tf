terraform {
  backend "s3" {
    bucket = "terraform-labs-sirfacu"
    key    = "lab46/lab46.tfstate"
    region = "us-east-1"
    profile = "sirfacu"
  }
}