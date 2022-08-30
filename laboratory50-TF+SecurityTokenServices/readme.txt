This study case focus on how to use the AssumeRole function from AWS that let us connect through many
different aacount with a single set of username and password.

the first step is configure within our provider block in providers.tf file assume role object
with the above information.

assume_role {
    role_arn = "arn:aws:iam:account_id:role/name_rol"
    session_name = "give_a_session_name"
}

Ex:

provider "aws" {
  region  = "us-east-1"
  profile = "sirfacu"
  assume_role {
    role_arn = "arn:aws:iam:123456789012:role/sirfacuRole"
    session_name = "myAssumeRole"
  }
}

in this way our project in terraform could assume the role neccesary to run and deploy whatever we require
we are only limited by the scope of the role.

command to assume role information

aws sts assume-role --role-arn "arn:aws:iam::account_id:role/name_rol --role-session-name session_name

this AssumeRole give to terraform the capability to run command 3 elements are neccesary: 

- access key
- secret key
- session token