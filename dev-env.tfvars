env                       = "dev"
aws_region                = "us-east-1"
instance_type             = "t3.micro"
instance_tag_name_prefix  = "ec2-module-dev"
instance_count            = 2
vpc_cidr_block            = "10.0.0.0/16"
public_subnet_cidr_block  = "10.0.1.0/24"
private_subnet_cidr_block = "10.0.2.0/24"