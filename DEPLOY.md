#Prereq
(Set up AWS CLI)[https ://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html#cli-quick-configuration-multi-profiles]
I'm using the aws credential profile *personal* in these examples.
Replace with whatever your credential file is configured for

#Make sure terraform state is up to date
* `terraform apply`

#Prep for deploying to beanstalk
*  `eb use eb-demo --profile personal`

#Deploy
*  Make sure your code is commited
*  `eb deploy --profile personal` Deploy
