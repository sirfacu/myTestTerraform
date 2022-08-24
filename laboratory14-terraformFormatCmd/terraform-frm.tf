
#before use terraform fmt command
provider "aws" {
      region  = "us-west-2"
  profile = "sirfacu"
}

resource "aws_instance" "my_ec2" {
  ami           = data.aws_ami.dataAmiId.id
      instance_type = "t2.micro"
     tags          = merge("${var.def-tags}", { Name = "lab12-instance" })
}


#result after use terraform fmt command
provider "aws" {
  region  = "us-west-2"
  profile = "sirfacu"
}

resource "aws_instance" "my_ec2" {
  ami           = data.aws_ami.dataAmiId.id
  instance_type = "t2.micro"
  tags          = merge("${var.def-tags}", { Name = "lab12-instance" })
}

/*to fix a file without a correct format we use <terraform fmt> command */