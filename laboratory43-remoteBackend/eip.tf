resource "aws_security_group" "myInstancesg" {
  name = "mysg-testing"
  ingress = [ {
    cidr_blocks = [ "190.87.123.210/32"]
    description = "My security group with terraform"
    from_port = 22
    to_port = 22
    ipv6_cidr_blocks = ["::/0"]
    prefix_list_ids = []
    protocol = "tcp"
    security_groups = []
    self = false
    
  } ]
}