module "sgmodule" {
  source = "../../modules/sg"
}


data "aws_ami" "dataAmiId" {
  most_recent = true
  owners      = ["amazon"]


  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}
resource "aws_instance" "nginx" {
  ami           = data.aws_ami.dataAmiId.id
  instance_type = var.instanceType
  tags                   = merge("${var.def-tags}", { Name = "lab37-modules+outputs" })
  vpc_security_group_ids = [module.sgmodule.mysgforec2]
}