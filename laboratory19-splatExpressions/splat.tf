resource "aws_iam_user" "myUsers" {
    name = "iamuser.${count.index}"
    count = 5
    path = "/system/"
    tags = merge("${var.def-tags}",{Name="lab19-user-${count.index}"})
}
output "iam_arns" {
    value = aws_iam_user.myUsers[0].arn  
}