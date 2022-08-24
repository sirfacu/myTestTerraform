/*




data "aws_ami" "dataAmiId" {
  most_recent = true
  owners      = ["amazon"]


  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}
resource "aws_security_group" "myInstance-sg" {
  name = var.sgname_webservers
  dynamic "ingress" {
    for_each = var.sg_ports
    content {
      cidr_blocks = [var.myIP]
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
    }
  }

  #I will remove this part to force a failure behavior
  dynamic "egress" {
    for_each = var.sg_ports_outbound
    content {
      cidr_blocks = ["0.0.0.0/0"]
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
    }
  }
  
  tags = merge("${var.def-tags}", { Name = "lab33-NullResource" })
}
resource "aws_instance" "nginx" {
  ami           = data.aws_ami.dataAmiId.id
  instance_type = var.instanceType
  key_name      = var.ssh_key_name
  tags                   = merge("${var.def-tags}", { Name = "lab33-NullResource" })
  vpc_security_group_ids = [aws_security_group.myInstance-sg.id]
  depends_on = [
    null_resource.health_check
  ]
}

resource "null_resource" "health_check" {
  provisioner "local-exec" {
    when = create
    command = "curl https://www.google.com"
  }
}



#other way to create a null resource is within the same resource that will be create for ex:
/*
resource "aws_instance" "nginx" {
  ami           = data.aws_ami.dataAmiId.id
  instance_type = var.instanceType
  key_name      = var.ssh_key_name
  tags                   = merge("${var.def-tags}", { Name = "lab33-NullResource" })
  vpc_security_group_ids = [aws_security_group.myInstance-sg.id]
  provisioner "local-exec" {
    when = create
    command = "curl https://www.google.com"
  }
}

#* /

*/