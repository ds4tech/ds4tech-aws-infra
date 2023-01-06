

locals {
  cluster_name = "ms-dev-k8s"
  region = "eu-central-1"
}

provider "aws" {
  region = local.region
}

module "ec2_instance" {
  source  = "../../modules/ec2"

  region          = local.region
  instance_name   = "micro-instance"
}

# module "additional_resources" {
#   source  = "../../modules/3rd_party"

#   region = local.region
#   vpc_id             = data.aws_vpc.selected.id
#   subnets            = data.aws_subnets.public.ids
#   security_group_id  = data.aws_security_groups.selected.ids
#   ec2_instance_id    = data.aws_instance.micro_instance.id
# }
