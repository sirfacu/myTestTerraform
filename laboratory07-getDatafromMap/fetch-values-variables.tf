provider "aws" {
  region  = "us-west-2"
  profile = "sirfacu"
}

resource "aws_instance" "lab7-ec2-instance" {
  ami           = "ami-098e42ae54c764c35"
  instance_type = var.instanceType["us-west-2"] #instanciando valores por referencia de llave en el map
  #instance_type = var.instanceType[0] #instanciando por indices en un list
  tags = var.def-tags
}