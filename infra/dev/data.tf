// Create aws_ami filter to pick up the ami available in your region
data "aws_ami" "amazon-linux-2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

data "aws_instance" "micro_instance" {
  filter {
    name   = "tag:Name"
    values = [var.instance_name]
  }
}

// select existing VPC
data "aws_vpc" "selected" {
  filter {
    name   = "tag:Name"
    values = ["education-vpc"]
  }
}

// select existing public subnet
data "aws_subnets" "public" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }
  filter {
    name   = "tag:Name"
    values = ["*public*"]
  }
}

data "aws_security_groups" "selected" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }
  filter {
    name   = "tag:Purpose"
    values = ["EC2 instance"]
  }
}

data "aws_eip" "vpc_ip" {
  tags = {
    Name = "education-vpc-eu-central-1a"
  }
}
# data "aws_eip" "by_filter" {
#   filter {
#     name   = "tag:Name"
#     values = ["exampleNameTagValue"]
#   }
# }