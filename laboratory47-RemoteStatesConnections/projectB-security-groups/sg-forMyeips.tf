resource "aws_security_group" "mySGForMyEIP" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"

  ingress {
    description      = "Enable HTTPS port to EIP"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["${data.terraform_remote_state.eip.outputs.eip_address}/32"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = merge("${var.def-tags}",{Name="lab47-ConnectingRemoteStates-projectB"})
}