

variable "security_group_id" {
  default = "sg-024e7ec7c67275fa3"
}

data "aws_subnet" "public_1a" {
  filter {
    name   = "tag:Name"
    values = ["education-vpc-public-eu-central-1a"]
  }
}