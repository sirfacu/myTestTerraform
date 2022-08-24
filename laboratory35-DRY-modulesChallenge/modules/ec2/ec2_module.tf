resource "aws_security_group" "allow_ssh_conn" {
  name = var.sgname
  dynamic "ingress" {
    for_each = var.sg_ports
    content {
      cidr_blocks = var.myIP
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
    }
  }
  dynamic "egress" {
    for_each = var.sg_ports_outbound
    content {
      cidr_blocks = ["0.0.0.0/0"]
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
    }
  }
  tags = merge("${var.def-tags}",{Name="lab35-DryModulesChallenge"})
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
  instance_type = var.instanceType
  vpc_security_group_ids  = [aws_security_group.allow_ssh_conn.id]
  tags = merge("${var.def-tags}",{Name="lab35-DryModulesChallenge"})
}