provider "aws" {
  region  = "us-west-2"
  profile = "sirfacu"
}
resource "aws_instance" "dev" {
  ami           = "ami-098e42ae54c764c35"
  instance_type = "t2.micro"
  tags = merge("${var.def-tags}",{Name="lab9-instance-dev"})
  count = var.istest == true ? 1 : 0
}
resource "aws_instance" "prod" {
  ami           = "ami-098e42ae54c764c35"
  instance_type = "t2.micro"
  tags = merge("${var.def-tags}",{Name="lab9-instance-prod"})
  count = var.istest == false ? 1 : 0
}