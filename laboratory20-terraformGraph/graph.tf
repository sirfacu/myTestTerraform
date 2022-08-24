data "aws_ami" "dataAmiId" {
  most_recent = true
  owners = ["amazon"]


  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_instance" "myec2" {
   ami = data.aws_ami.dataAmiId.id
   instance_type = "t2.micro"
   tags = merge("${var.def-tags}",{Name="lab20-instance"})
}

resource "aws_eip" "lb" {
  instance = aws_instance.myec2.id
  vpc      = true
  tags = merge("${var.def-tags}",{Name="lab20-instance"})
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["${aws_eip.lb.private_ip}/32"]

  }
  tags = merge("${var.def-tags}",{Name="lab20-instance"})
}

/* commands to use

terraform graph > name_file.dot 



*/