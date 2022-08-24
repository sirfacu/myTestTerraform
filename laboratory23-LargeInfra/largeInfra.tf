/*

We must take in count that the api from the provider has a limit so many cases if you have a large infra it will be possible one or more fail
so one of the best practices is separate in multiples files through same number of folders
in case another person running the same job you should use -refresh=false flag in the moment that you run the terraform apply/plan

Another option to work with a large infra is defining or specifying the resources to update or modify with the -targe=resource flag

Please run this command to see the behavior that it show you

terraform plan -refresh=false 
terraform plan -refresh=false -target=aws_security_group.allow_ssh_conn

*/
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}

resource "aws_security_group" "allow_ssh_conn" {
  name        = "allow_ssh_conn"
  description = "Allow SSH inbound traffic"

  ingress {
    description = "SSH into VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "HTTP into VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "Outbound Allowed"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
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
  instance_type = "t2.micro"
  vpc_security_group_ids  = [aws_security_group.allow_ssh_conn.id]
  tags          = merge("${var.def-tags}",{Name="lab23-instance"})
}

/*
 * terraform plan -refresh=false
 * terraform plan -refresh=false -target=aws_security_group.allow_ssh_conn
 *
*/