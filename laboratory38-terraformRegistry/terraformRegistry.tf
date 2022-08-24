
module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"
  name = "simpleInstance"
  ami                    = "ami-05fa00d4c63e32376"
  instance_type          = var.instanceType
  key_name               = var.ssh_key_name
  tags = var.def-tags

}