terraform {
  backend "s3" {
    bucket = "terraform-labs-sirfacu"
    key    = "lab47/projectB/lab47-B.tfstate"
    region = "us-east-1"
    profile = "sirfacu"
  }
}