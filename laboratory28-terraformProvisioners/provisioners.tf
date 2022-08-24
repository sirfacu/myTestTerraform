/*
* Provisioners are used to execute scripts on local or remote machine as part of resource creation/destruction
* LOCAL EXEC PROVISIONERS
* this is an example block for a local exec --> it means that will perform the actions configured on the local machine from
* were terraform apply has been run

resource "aws_instance" "web" {
    #
    #
    #
}

provisioner "local exec" "name"{
    command = "echo ${aws_instance.web.private_ip} >> private_ips.txt"
}


*
*
*/

data "aws_ami" "dataAmiId" {
  most_recent = true
  owners = ["amazon"]


  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}
resource "aws_security_group" "myInstancesg" {
  name = var.sgname
  ingress = [ {
    cidr_blocks = [ var.myIP ]
    description = "My security group with terraform"
    from_port = 22
    to_port = 22
    ipv6_cidr_blocks = ["::/0"]
    prefix_list_ids = []
    protocol = "tcp"
    security_groups = []
    self = false
    
  } ]
  tags = merge("${var.def-tags}",{Name="lab28-terraformProvisioners"})
}
resource "aws_instance" "nginx" {
   ami           = data.aws_ami.dataAmiId.id
   instance_type = var.instanceType
   tags          = merge("${var.def-tags}",{Name="lab28-nginx+Provisioners"})

   provisioner "remote-exec" {
     inline = [
        "sudo amazon-linux-extras install -y nginx1.12",
        "sudo systemctl start nginx"
     ]

     connection {
       type = "ssh"
       host = self.public_ip
       user = "ec2-user"
       private_key = "${file("./terraform.pem")}"
     }
   }
   vpc_security_group_ids = [aws_security_group.myInstancesg.id]
}
