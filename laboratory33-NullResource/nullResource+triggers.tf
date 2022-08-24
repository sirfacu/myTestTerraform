/*



*/
resource "aws_eip" "myIps" {
  vpc = true
  count = 3
}


resource "null_resource" "ip_check" {
  triggers = {
    latest_ips = join(",",aws_eip.myIps[*].public_ip)
  }
  provisioner "local-exec" {
    command = "echo Latest IPs are ${null_resource.ip_check.triggers.latest_ips} > sample.txt"
  }
}