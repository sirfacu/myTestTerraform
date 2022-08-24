provider "aws" {
  region     = "us-west-2"
  profile = "sirfacu"
}

resource "aws_security_group" "sg-testingVariables" {
    ingress = [ {
      cidr_blocks = [ var.vpn_ip ]
      description = "Creating sg with variables terraform 1"
      from_port = 80
      ipv6_cidr_blocks = [ "::/0" ]
      prefix_list_ids = [ ]
      protocol = "tcp"
      security_groups = [  ]
      self = false
      to_port = 80
    }
    ,
    {
      cidr_blocks = [ var.vpn_ip ]
      description = "Creating sg with variables terraform 2"
      from_port = 443
      ipv6_cidr_blocks = [ "::/0" ]
      prefix_list_ids = [ ]
      protocol = "tcp"
      security_groups = [  ]
      self = false
      to_port = 443
    }
    ,
    {
      cidr_blocks = [ var.vpn_ip ]
      description = "Creating sg with variables terraform 3"
      from_port = 53
      ipv6_cidr_blocks = [ "::/0" ]
      prefix_list_ids = [ ]
      protocol = "tcp"
      security_groups = [  ]
      self = false
      to_port = 53
    }
     ]
  
}