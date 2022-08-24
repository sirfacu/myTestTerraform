resource "aws_iam_user" "myusers" {
    name = var.iam_names[count.index]
    count = 5
    path = "/system/"
    tags = merge("${var.def-tags}",{Name="lab25-users"}) 
}

/*

the first apply was using count 3 and just variables user-1 to user-3
once we did an apply it takes the values now we added user-4 at the end of the list and apply again
this time the new resource also was implemented.

now we added a the user-0 at the begin of the list and performed a terraform apply this time it show us that the resources will be rename,
let's do a terraform apply but it fail this time.

aws_iam_user.myusers[0]: Modifications complete after 2s [id=user-00]
aws_iam_user.myusers[1]: Modifications complete after 2s [id=user-01]
aws_iam_user.myusers[2]: Modifications complete after 2s [id=user-02]
╷
│ Error: Error updating IAM User user-04: EntityAlreadyExists: User with name user-03 already exists.
│       status code: 409, request id: 387df1f7-a363-4e1c-884c-b071dfc0b065
│ 
│   with aws_iam_user.myusers[3],
│   on challenge-count.tf line 1, in resource "aws_iam_user" "myusers":
│    1: resource "aws_iam_user" "myusers" {
│ 
╵
╷
│ Error: failed creating IAM User (user-04): EntityAlreadyExists: User with name user-04 already exists.
│       status code: 409, request id: 4264fe4e-5bee-4497-ac7b-e53b766546c3
│ 
│   with aws_iam_user.myusers[4],
│   on challenge-count.tf line 1, in resource "aws_iam_user" "myusers":
│    1: resource "aws_iam_user" "myusers" {


so that's the reason why we need to take care using count when creating resources

count --> is ideal when all resources that you need create are almost identical, but if for example you need some arguments of the resources
          have a different value you must use for_each instead of count
*/