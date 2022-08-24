variable "sg_ports" {
  type        = list(number)
  description = "list of ingress ports"
  default     = [8200, 8201, 8300, 9200, 9500, 8080, 8180, 8280]
}

resource "aws_security_group" "dynamicsg" {
  name        = "dynamic-sg"
  description = "Ingress for Vault"

  dynamic "ingress" {
    for_each = var.sg_ports
    iterator = port #is possible use the iterator argument to represent the current element 
    content {
      from_port   = port.value
      #from_port   = ingress.value #it's the way when we don't use the iterator so, we invoke the name of the dynamic block in this case "ingress"
      to_port     = port.value
      #to_port     = ingress.value #it's the way when we don't use the iterator so, we invoke the name of the dynamic block in this case "ingress"
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  dynamic "egress" {
    for_each = var.sg_ports
    content {
      from_port   = egress.value
      to_port     = egress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  tags = merge("${var.def-tags}", { Name = "lab17-securityGroup" })
}