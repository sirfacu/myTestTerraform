provider "aws" {
  region     = "us-west-2"
  access_key = "AKIATQHYAAGUZAVTXOXX"
  secret_key = "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"
}

resource "aws_instance" "my_ec2" {
  ami           = "ami-098e42ae54c764c35"
  instance_type = "t2.micro"
  tags = {
    Name = "my_ec2",
    env = "laboratorio-1-aws-terraform"
  }
}