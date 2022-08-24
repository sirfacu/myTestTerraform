provider "aws" {
  region     = "us-west-2"
  access_key = "AKIATQHYAAGUZAVTXOXX"
  secret_key = "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"
}

resource "aws_eip" "lb" {
  vpc      = true
}

output "eip" {
  value = aws_eip.lb
}

resource "aws_s3_bucket" "my-bucket-on-s3" {
  bucket = "sirfacu-bucket-on-s3"
}

output "mys3bucket" {
  value = aws_s3_bucket.my-bucket-on-s3
}