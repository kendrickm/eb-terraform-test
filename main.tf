provider "aws" {
  profile = "personal"
  region  = "us-east-2"
  version = "~> 2.17.0"
}

resource "aws_elastic_beanstalk_application" "eb-demo" {
  name        = "eb-demo"
  description = "eb-demo"
}

resource "aws_elastic_beanstalk_environment" "eb-demo" {
  name                = "eb-demo"
  application         = "${aws_elastic_beanstalk_application.eb-demo.name}"
  solution_stack_name = "64bit Amazon Linux 2018.03 v2.13.0 running Docker 18.06.1-ce"
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name = "IamInstanceProfile"
    value = "aws-elasticbeanstalk-ec2-role"
  }
  setting {
   namespace = "aws:elasticbeanstalk:cloudwatch:logs"
   name      = "StreamLogs"
   value     = "true"
 }
}

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
