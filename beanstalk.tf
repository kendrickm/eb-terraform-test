variable "aws_region" {
  default = "us-east-2"
}

provider "aws" {
  profile = "personal"
  region  = "${var.aws_region}"
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
