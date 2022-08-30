resource "aws_instance" "my_ec2_east" {
  ami           = "ami-05fa00d4c63e32376"
  instance_type = "t2.micro"
  tags = merge("${var.def-tags}",{Name="lab49-DeployingMultipleRegions-InstanceEast"})
}

resource "aws_instance" "my_ec2_west" {
  provider = aws.secondZone   # If we want to deploy through different AZ we need to 
                              # configure our variable provider within the resource (s)
  ami           = "ami-018d291ca9ffc002f"
  instance_type = "t2.micro"
  tags = merge("${var.def-tags}",{Name="lab49-DeployingMultipleRegions-instanceWest"})
}