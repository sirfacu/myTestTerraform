/*
Terraform has a lot of functions, the main categories are as below:
Numeric:
String
Collection
Encoding
Filesystem
Date and time
Hash and crypto
IP Network
Type Conversion

Terraform no soporta funciones que el usuario defina

*/

provider "aws" {
  region  = "us-west-2"
  profile = "sirfacu"
}

locals {
  time = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
}

resource "aws_key_pair" "loginkey" {
  key_name   = "login-key"
  public_key = file("${path.module}/id_rsa.pub")
}

resource "aws_instance" "app-dev" {
   #lookup function search inside a map(user provide it) the corresponding value from the key provided
   ami = lookup(var.ami,var.region)
   instance_type = "t2.micro"
   key_name = aws_key_pair.loginkey.key_name
   count = 2

   tags = {
     # element function search inside a list (user provide it) the corresponding value from the index provided
     Name = element(var.tags,count.index)
   }
}


output "timestamp" {
  value = local.time
}