
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.18.1"

  name = local.name
  cidr = "10.99.0.0/18"

  azs              = ["${local.region}a", "${local.region}b", "${local.region}c"]
  public_subnets   = ["10.99.0.0/24", "10.99.1.0/24", "10.99.2.0/24"]
  private_subnets  = ["10.99.3.0/24", "10.99.4.0/24", "10.99.5.0/24"]
  database_subnets = ["10.99.7.0/24", "10.99.8.0/24", "10.99.9.0/24"]

  create_database_subnet_group = true
  # these parameters are used by RDS instance which is publicly accessible
  create_database_subnet_route_table     = true
  create_database_internet_gateway_route = true
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = local.tags
}

module "security_group_rds" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 4.0"

  name        = local.name
  description = "security group for PostgreSQL "
  vpc_id      = module.vpc.vpc_id

  # ingress
  ingress_with_cidr_blocks = [
    {
      from_port   = 5432
      to_port     = 5432
      protocol    = "tcp"
      description = "PostgreSQL access from within VPC"
      # cidr_blocks = module.vpc.vpc_cidr_block
      cidr_blocks = "0.0.0.0/0"
    },
  ]
  # egress
  egress_with_cidr_blocks = [
    {
      from_port   = 5432
      to_port     = 5432
      protocol    = "tcp"
      description = "egress access"
      cidr_blocks = "0.0.0.0/0"
    },
  ]

  tags = local.tags
}
module "security_group_ec2" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 4.0"

  name        = local.name
  description = "example for PostgreSQL security group"
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
      description = "Nginx port"
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

  tags = local.tags
}
