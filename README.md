# Terraform-AWS

This repository, I'll show you, how we can build VPC, EC2 using terraform. I created some files of configuration, but first you need have the terraform installed.

The files are:
- ec2.tf: inside this archive has 4 basic configuration of instances like: type of instance, name, ami type, key and subnet configuration.
- provider.tf: this archive has the account configuration like: provider(AWS, Digital Ocean, Azure...), access key, security key and region.
- vpc.tf: this archive has all configuration of access to internet, in this file I created a new VPC, Subnet, Internet Gateway, Route Table, Route, Security Group.
- loadbalance.tf: this archive is a loadbalance configuration using instances created on EC2 by ec2.tf
- input_variables.tf: this archive is responsable by access key and input configurations
