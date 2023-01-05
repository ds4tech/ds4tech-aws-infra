
output "security_group_id_one" {
  description = "Security group ids attached to the cluster control plane"
  value       = module.security_group_eks_one.security_group_id
}
output "security_group_name_one" {
  description = "Security group name attached to the cluster control plane"
  value       = module.security_group_eks_one.security_group_name
}

output "security_group_name_two" {
  description = "Security group name attached to the cluster control plane"
  value       = module.security_group_eks_two.security_group_name
}
output "security_group_id_two" {
  description = "Security group ids attached to the cluster control plane"
  value       = module.security_group_eks_two.security_group_id
}
output "region" {
  description = "AWS region"
  value       = var.region
}

