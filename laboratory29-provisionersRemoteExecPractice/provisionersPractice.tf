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
  dynamic "egress" {
    for_each = var.sg_ports_outbound
    content {
      cidr_blocks = ["0.0.0.0/0"]
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
    }
  }
  
  tags = merge("${var.def-tags}", { Name = "lab28-terraformProvisioners" })
}
resource "aws_instance" "nginx" {
  ami           = data.aws_ami.dataAmiId.id
  instance_type = var.instanceType
  key_name      = var.ssh_key_name
  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"
    private_key = file("./terraform-key.pem")
  }
  provisioner "remote-exec" {
    inline = [
      "sudo amazon-linux-extras install -y nginx1",
      "sudo systemctl start nginx"
    ]
  }
  tags                   = merge("${var.def-tags}", { Name = "lab29-nginx+Provisioners" })
  vpc_security_group_ids = [aws_security_group.myInstance-sg.id]
}
