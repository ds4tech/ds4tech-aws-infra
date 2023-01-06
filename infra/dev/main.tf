provider "aws" {
  region = var.region
}

module "ec2_instance" {
  source  = "../../modules/ec2"

  region          = var.region
  instance_name   = var.instance_name
  vpc_name        = var.vpc_name
}

module "additional_resources" {
  source  = "../../modules/3rd_party"

  region             = var.region
  vpc_id             = data.aws_vpc.selected.id
  subnets            = data.aws_subnets.public.ids
  security_group_id  = data.aws_security_groups.selected.ids
  ec2_instance_id    = data.aws_instance.micro_instance.id
}
