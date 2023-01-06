
locals {
  name   = "ds4tech-dev-3rd_party"


  tags = {
    Name        = local.name
    email       = "ds4tech@gmail.com"
    owner       = "Mateusz Szymczyk"
    Terraform   = "true"
    Environment = "dev"
  }
}
