resource "aws_iam_group_policy" "observers_policy" {
  group = "${aws_iam_group.observers.id}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
            "logs:DescribeLogGroups",
            "logs:DescribeLogStreams",
            "logs:DescribeMetricFilters",
            "logs:FilterLogEvents",
            "logs:GetLogEvents"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_group" "observers" {
  name = "observers"
}

resource "aws_iam_user_group_membership" "john_doe_observers" {
  user = "${aws_iam_user.john_doe.name}"

  groups = [
    "${aws_iam_group.observers.name}",
  ]
}

resource "aws_iam_user" "john_doe" {
  name = "john_doe"
}
