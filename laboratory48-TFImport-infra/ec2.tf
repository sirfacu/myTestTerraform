resource "aws_instance" "myImportEC2" {
  ami = "ami-05fa00d4c63e32376"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-08e7e7f354b923174"]
  tags = merge("${var.def-tags}",{Name="lab48-TFImportingInfra-EC2Instance"})
}