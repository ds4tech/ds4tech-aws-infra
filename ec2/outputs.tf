
output "region" {
  description = "AWS region"
  value       = local.region
}

output "instance_IP" {
  description = "EC2 instance ip address"
  value       = module.ec2_instance.public_ip
}