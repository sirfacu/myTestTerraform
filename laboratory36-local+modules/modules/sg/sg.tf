resource "aws_security_group" "ec2_sg" {
    name = var.sgname

    ingress  {
        cidr_blocks = [var.myIP]
        from_port   = local.ingressPortEC2
        to_port     = local.ingressPortEC2
        protocol    = "tcp"
      
    }
    egress {
      cidr_blocks = ["0.0.0.0/0"]
      from_port   = 0
      to_port     = 0
      protocol    = -1
    }
    tags = merge("${var.def-tags}",{Name="lab36-Locals+Modules"})
}
resource "aws_security_group" "elb_sg" {
    name = var.sgnameELB

    ingress  {
        cidr_blocks = [var.myIP]
        from_port   = local.ingressPortELB
        to_port     = local.ingressPortELB
        protocol    = "tcp"
      
    }
    egress {
      cidr_blocks = ["0.0.0.0/0"]
      from_port   = 0
      to_port     = 0
      protocol    = -1
    }
    tags = merge("${var.def-tags}",{Name="lab36-Locals+Modules"})
}

locals{
    ingressPortEC2 = 80
    ingressPortELB = 8448
}