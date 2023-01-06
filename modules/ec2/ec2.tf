module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.2.1"

  name    = var.instance_name

  ami                         = data.aws_ami.amazon-linux-2.id
  instance_type               = "t2.micro"
  key_name                    = "11.22-kp-aws"
  monitoring                  = true
  associate_public_ip_address = true
  vpc_security_group_ids      = data.aws_security_groups.selected.ids
  subnet_id                   = data.aws_subnets.public.ids[0]

  user_data_base64 = base64encode(local.user_data)

  tags = local.tags
}

# module "eip" {
#   source  = "jfcantu/eip/aws"
#   version = "1.0.1"
#   instance = module.ec2_instance.id
# associate_with_private_ip = 
# network_interface = 
# }
