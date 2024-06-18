provider "aws" {
  region   = "us-east-1"
  profile  = "B-34"
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
