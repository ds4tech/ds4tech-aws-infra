locals {
  name = "ds4tech-dev-infra-network"
  cluster_name   = "ms-dev-k8s"
  region = "eu-central-1"

  tags = {
    Name        = local.name
    email       = "ds4tech@gmail.com"
    owner       = "Mateusz Szymczyk"
    Terraform   = "true"
    Environment = "dev"
  }
}
