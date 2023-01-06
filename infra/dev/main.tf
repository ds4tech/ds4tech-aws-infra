

locals {
  cluster_name = "ms-dev-k8s"
  region = "eu-central-1"
}

provider "aws" {
  region = local.region
}

module "ec2_instance" {
  source  = "../../modules/ec2"

  region = local.region
}

module "3rd_party" {
  source  = "../../modules/3rd_party"

  region = local.region
  vpc_id             = module.vpc.vpc_id
  subnets            = module.vpc.public_subnets
  security_groups    = [module.security_group_ec2.security_group_id]
}
