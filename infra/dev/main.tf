
# provider "aws" {
#   region = local.region
# }

module "ec2_instance" {
  source  = "../../modules/ec2"

  region = "eu-central-1"
}