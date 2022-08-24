provider "aws" {
  region     = "us-west-2"
  #access_key = "AKIATQHYAAGUZAVTXOXX"
  #secret_key = "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"
  profile = "sirfacu"
}

resource "aws_instance" "my_ec2" {
  ami           = "ami-098e42ae54c764c35"
  instance_type = "t2.micro"
  tags = {
    Name = "my_ec2",
    env = "laboratorio-3-aws-terraform"
  }
}

resource "aws_eip" "myElastiIP" {
  vpc      = true
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.my_ec2.id
  allocation_id = aws_eip.myElastiIP.id
}

##parte 2 agregando o mejor asociando a un security-group

resource "aws_security_group" "my-security-group" {
  name = "lab4-usingOutputs+securityGroup"
  ingress = [ {
    cidr_blocks = [ "${aws_eip.myElastiIP.public_ip}/32" ]
    description = "My security group with terraform outputs"
    from_port = 443
    ipv6_cidr_blocks = ["::/0"]
    prefix_list_ids = []
    protocol = "tcp"
    security_groups = []
    self = false
    to_port = 443
  } ]
}