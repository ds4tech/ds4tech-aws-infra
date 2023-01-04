
output "security_group_id_one" {
  description = "Security group ids attached to the cluster control plane"
  value       = aws_security_group.node_group_one.id
}

output "security_group_id_two" {
  description = "Security group ids attached to the cluster control plane"
  value       = aws_security_group.node_group_two.id
}
output "region" {
  description = "AWS region"
  value       = var.region
}

