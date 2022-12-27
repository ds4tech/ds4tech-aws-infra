
locals {
  name   = "ds4tech"
  region = "eu-central-1"

  # engine                = "postgres"
  # engine_version        = "14.1"
  # family                = "postgres14" # DB parameter group
  # major_engine_version  = "14"         # DB option group
  # instance_class        = "db.t4g.micro"
  # allocated_storage     = 20
  # max_allocated_storage = 100
  # port                  = 5432

  # user_data = <<-EOF
  #   #!/bin/bash -ex
  #   yum update -y

  #   amazon-linux-extras install -y libpq #postgresql14
  #   amazon-linux-extras install -y nginx1
    
  #   echo "<h1>$(curl https://api.kanye.rest/?format=text)</h1>" >  /usr/share/nginx/html/index.html 
  #   systemctl enable nginx
  #   systemctl start nginx
    
  #   EOF

  tags = {
    Name        = local.name
    email       = "ds4tech@gmail.com"
    owner       = "Mateusz Szymczyk"
    Terraform   = "true"
    Environment = "dev"
  }
}
