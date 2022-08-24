data "aws_ami" "dataAmiId" {
  most_recent = true
  owners = ["amazon"]


  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}
resource "aws_instance" "taint" {
   ami           = data.aws_ami.dataAmiId.id
   instance_type = "t2.micro"
   tags          = merge("${var.def-tags}",{Name="lab18-taintInstance"})
}

/* 

the first thing to do is mark the resource(s) as taint it could be done executing this command:

terraform taint resource.nameOfResource

ex:
terraform taint aws_instance.taint

then is possible recreate the resource(s) tainted

*/