
output "region" {
  description = "AWS region"
  value       = local.region
}

output "instance_IP" {
  description = "EC2 instance ip address"
  value       = module.ec2_instance.public_ip
}

output "VPC_public_IP_address" {
  description = "existing public ip address"
  value       = data.aws_eip.vpc_ip.public_ip
}