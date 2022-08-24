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

/*

    to save this specific plan to a file run the command:

    #terraform plan -out=/path/to/a/file

    it's not extensively used, the main idea of this is keep the same resources and I think is a good option if you don't have a repository
*/