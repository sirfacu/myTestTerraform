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
  key_name      = var.ssh_key_name
  provisioner "local-exec" {
    command = "echo ${aws_instance.nginx.private_ip} >> private_ips.txt"
  }
  tags = merge("${var.def-tags}", { Name = "lab30-nginx+Provisioners" })
}

