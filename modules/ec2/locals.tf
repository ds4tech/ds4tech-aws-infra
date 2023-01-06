
locals {
  user_data = <<-EOF
    #!/bin/bash -ex
    yum update -y

    amazon-linux-extras install -y postgresql14
    amazon-linux-extras install -y nginx1
    
    echo "<h1>$(curl https://api.kanye.rest/?format=text)</h1>" >  /usr/share/nginx/html/index.html 
    systemctl enable nginx
    systemctl start nginx
    
    EOF

  tags = {
    Name        = var.instance_name
    email       = "ds4tech@gmail.com"
    owner       = "Mateusz Szymczyk"
    Terraform   = "true"
    Environment = "dev"
  }
}
