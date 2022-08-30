#Here I created the data source that fetch the output values from project A
#in this case the eip public_id value

data "terraform_remote_state" "eip" {
  backend = "s3"

  config = {
    bucket = "terraform-labs-sirfacu"
    key    = "lab47/projectA/lab47-A.tfstate"
    region = "us-east-1"
    profile = "sirfacu"
    }
  }