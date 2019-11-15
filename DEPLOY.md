## Prereq

* [Set up AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html#cli-quick-configuration-multi-profiles)
* [Set up EB CLI](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/eb-cli3-install-advanced.html)
* [Set up Terraform](https://www.terraform.io/downloads.html)

I'm using the aws credential profile *personal* in these examples.
Replace with whatever your credential file is configured for in both these commands, and the provider section of the main.tf

## Make sure terraform state is up to date
* `terraform apply`

## Prep for deploying to beanstalk
*  `eb use eb-demo --profile personal`

## Deploy
*  Make sure your code is commited
*  `eb deploy --profile personal`  -- Deploy your code to beanstalk
