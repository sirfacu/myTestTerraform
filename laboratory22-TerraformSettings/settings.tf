terraform {
  required_providers {
    aws = "~> 2.0"
  } 
}

data "aws_ami" "dataAmiId" {
  most_recent = true
  owners = ["amazon"]


  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_instance" "my_ec2" {
  ami           = data.aws_ami.dataAmiId.id
  instance_type = "t2.micro"
  tags          = merge("${var.def-tags}",{Name="lab21-instance"})
}