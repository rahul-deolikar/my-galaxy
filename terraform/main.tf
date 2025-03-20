provider "aws" {
  region   = "us-east-1"
  profile  = "B-34"
}

resource "aws_instance" "vm-1" {
    ami = "ami-04b70fa74e45c3917"
    instance_type = "t2.micro"
    availability_zone = "us-east-1a"
    key_name = "B-34"
     tags = {
        name = "server-1"
     }
}

resource "aws_iam_user" "user-1" {
  name = "usr-1"
}

resource "aws_iam_user" "user-2" {
  name = "usr-2"
}

resource "aws_iam_user" "user-3" {
  name = "usr-3"
}

resource "aws_iam_user" "user-4" {
  name = "usr-4"
}

resource "aws_iam_group" "group-1" {
  name = "grp-1"
}

resource "aws_iam_user_group_membership" "mbr-1" {
  user =  aws_iam_user.user-1.name

  groups = [
    aws_iam_group.group-1.name
  ]
}

resource "aws_iam_user_group_membership" "mbr-2" {
  user = aws_iam_user.user-2.name

  groups = [
    aws_iam_group.group-1.name
  ]
}

resource "aws_iam_user_group_membership" "mbr-3" {
  user = aws_iam_user.user-3.name

  groups = [
    aws_iam_group.group-1.name
  ]
}
