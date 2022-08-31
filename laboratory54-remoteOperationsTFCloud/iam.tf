resource "aws_iam_user" "myIAMuser" {
  name = "usertest-lab54"
  path = "/system/"
  tags = merge("${var.def-tags}",{Desc="lab54-remoteOperations-terraformCloud"})
}