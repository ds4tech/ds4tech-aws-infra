

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