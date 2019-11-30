output "asso_sgid" {
  description = "List of VPC security group ids assigned to the instances"
  value       = module.security_group.asso_sg_id
}