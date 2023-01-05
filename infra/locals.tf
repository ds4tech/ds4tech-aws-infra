
locals {
  name   = "ds4tech-dev-infra"
  region = "eu-central-1"


  tags = {
    Name        = local.name
    email       = "ds4tech@gmail.com"
    owner       = "Mateusz Szymczyk"
    Terraform   = "true"
    Environment = "dev"
  }
}
