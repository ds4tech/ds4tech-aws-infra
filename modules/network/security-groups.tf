
module "security_group_ec2" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 4.0"

  name        = local.name
  description = "security group for EC2 instance"
  vpc_id      = module.vpc.vpc_id

  # ingress
  ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "User-service ports"
      cidr_blocks = "178.43.111.48/32"
    },
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      description = "Nginx on EC2"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 81
      to_port     = 81
      protocol    = "tcp"
      description = "fixed-response from ALB"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
  # egress
  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = -1
      description = "egress access"
      cidr_blocks = "0.0.0.0/0"
    },
  ]

  tags = "${merge(local.tags, {Purpose="EC2 instance"})}"
}

module "security_group_eks_one" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 4.0"

  name        = "node_group_one"
  # name_prefix = "node_group_one"
  use_name_prefix = true
  description = "SG for node_group_one"
  vpc_id      = module.vpc.vpc_id

  # ingress
  ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      # description = "User-service ports"
      cidr_blocks = "10.0.0.0/8"
    },
  ]
  # egress
  # egress_with_cidr_blocks = [
  #   {
  #     from_port   = 0
  #     to_port     = 0
  #     protocol    = -1
  #     description = "egress access"
  #     cidr_blocks = "0.0.0.0/0"
  #   },
  # ]

  # lifecycle {
  #   # Necessary if changing 'name' or 'name_prefix' properties.
  #   create_before_destroy = true
  # }
  
  tags = "${merge(local.tags, {Purpose="node_group_one"})}"
}


module "security_group_eks_two" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 4.0"

  name        = "node_group_two"
  # name_prefix = "node_group_two"
  use_name_prefix = true
  description = "SG for node_group_two"
  vpc_id      = module.vpc.vpc_id

  # ingress
  ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      # description = "User-service ports"
      cidr_blocks = "192.168.0.0/16"
    },
  ]
  # egress
  # egress_with_cidr_blocks = [
  #   {
  #     from_port   = 0
  #     to_port     = 0
  #     protocol    = -1
  #     description = "egress access"
  #     cidr_blocks = "0.0.0.0/0"
  #   },
  # ]

  # lifecycle {
  #   # Necessary if changing 'name' or 'name_prefix' properties.
  #   create_before_destroy = true
  # }
  tags = "${merge(local.tags, {Purpose="node_group_two"})}"
}
