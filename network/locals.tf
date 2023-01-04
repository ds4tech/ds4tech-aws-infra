locals {
  cluster_name = "ds4tech-dev-k8s"
  name   = "ds4tech"
  region = "eu-central-1"

  tags = {
    Name        = local.cluster_name
    email       = "ds4tech@gmail.com"
    owner       = "Mateusz Szymczyk"
    Terraform   = "true"
    Environment = "dev"
    Purpose     = "education"
  }
}
