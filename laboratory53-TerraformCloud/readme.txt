Terraform cloud is a collaborative tool for organizations and persons who want work in a collaborative way with Terraform
it provide a environment where you can run any github,bitbucket project in the same way that you will perform on your CLI
but with a plus that keeps the same environemnt to anyone who run the same project.

some tools on terraform cloud are:

SENTINEL (paid feature)

is a policy-as-code framework integrated with hashicorp it enables a fine grained, logic policy decisions and extends to use
from external sources.

a policy could be block any deployment of EC2 instances without any or an specific tag, block deployment when a sg have a CIDR
as 0.0.0.0/0 rule

REMOTE BACKENDS


FILE iam.tf 
<------------------------>
terraform {
    required_version = "~> 0.12.0"
    backend "remote" {

    }
}

resource "aws_iam_user" "lb" {
    name = "remoteuser"
    path = "/system"
}
<------------------------>

FILE backend.hcl
<------------------------>
workspaces { name = "your-workspace-in-terraform-Cloud" }
hostname = "aap.terraform.io"
organization = "organization-name-within-terraform-cloud"
<------------------------>

using those files in a project we can run terraform actions from terraform cloud and for example if you have the paid features as
cost estimation it will show you the cost through the CLI and also the sentinel policies checks will be validate.

Remember have in mind that you only can execute if a VCS is not attached to the workspace if not it will not run
