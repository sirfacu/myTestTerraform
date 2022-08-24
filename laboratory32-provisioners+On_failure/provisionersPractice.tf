/*

In this example we are going to apply the concept of on_failure option to provisioner
we have 2 options in this case:

continue: ignore the error and continue with process (creation/destruction)
fail:  Raise an error and stop applying in this case if is a creation process it will mark 
the resources as tainted

ex:  

provisioner "local-exec" {
    when = destroy
    command = "echo 'this is an example message' "
    on_failure = continue/fail
  }
*/
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
  /*dynamic "egress" {
    for_each = var.sg_ports_outbound
    content {
      cidr_blocks = ["0.0.0.0/0"]
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
    }
  }*/
  
  tags = merge("${var.def-tags}", { Name = "lab32-practiceProvisionersWhen" })
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
    when = create
    on_failure = continue
    inline = [
      "sudo yum -y install nano"

    ]
  }
  provisioner "remote-exec" {
    when = destroy
    inline = [
      "sudo yum -y remove nano"
    ]
  }
  provisioner "local-exec" {
    when = create
    command = "echo ${aws_instance.nginx.private_ip} >> private_ip_address.txt"
  }
  provisioner "local-exec" {
    when = destroy
    command = "rm -rf private_ip_address.txt"
  }
  tags                   = merge("${var.def-tags}", { Name = "lab32-practiceProvisionersOnFailure" })
  vpc_security_group_ids = [aws_security_group.myInstance-sg.id]
}