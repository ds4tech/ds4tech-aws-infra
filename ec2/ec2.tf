// Create aws_ami filter to pick up the ami available in your region
data "aws_ami" "amazon-linux-2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.2.1"

  name = "micro-instance"

  ami                    = data.aws_ami.amazon-linux-2.id
  instance_type          = "t2.micro"
  key_name               = "11.22-kp-aws"
  monitoring             = true
  # associate_public_ip_address = false
  vpc_security_group_ids = [var.security_group_id]
  subnet_id              = "subnet-04f8cb5655bafd47e"#data.aws_subnet.public_1a

  user_data_base64            = base64encode(local.user_data)

  tags = local.tags
}

module "eip" {
  source  = "jfcantu/eip/aws"
  version = "1.0.1"
  instance = module.ec2_instance.id
  # associate_with_private_ip = 
  # network_interface = 
}
