resource "aws_eip" "myElasticIPS" {
  vpc = true
  tags = merge("${var.def-tags}",{Name="lab47-ConnectingRemoteStates-projectA"})
}
output "eip_address" {
  value = aws_eip.myElasticIPS.public_ip
}