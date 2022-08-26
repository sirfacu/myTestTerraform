terraform {
  backend "s3" {
    bucket = "terraform-labs-sirfacu"
    key    = "lab47/lab47.tfstate"
    region = "us-east-1"
    profile = "sirfacu"
  }
}