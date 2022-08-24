/*

zipmap is a map with a listkeys = value form

the basic definition is:

zipmap(keyslist,valuesList)

keylist must be a list of strings
valueslist can be a list of any type

could be exist same values for multiple keyslist so the value with the highest index is used in the resulting map



*/
resource "aws_iam_user" "myusers" {
    name = "iamuser-${count.index}"
    count = 3
    path = "/home/"
  
}

output "arns" {
    value = aws_iam_user.myusers[*].arn  
}
output "name" {
    value = aws_iam_user.myusers[*].name  
}

output "combine" {
    value = zipmap(aws_iam_user.myusers[*].name,aws_iam_user.myusers[*].arn)
}