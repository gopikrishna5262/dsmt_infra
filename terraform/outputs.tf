output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "vpc_cidr" {
  description = "VPC CIDR"
  value       = module.vpc.vpc_cidr
}

output "frontend_subnet_ids" {
  description = "Frontend subnet IDs"
  value       = module.vpc.frontend_subnet_ids
}

output "backend_subnet_ids" {
  description = "Backend subnet IDs"
  value       = module.vpc.backend_subnet_ids
}

output "database_subnet_ids" {
  description = "Database subnet IDs"
  value       = module.vpc.database_subnet_ids
}

output "frontend_route_table_id" {
  description = "Frontend route table ID"
  value       = module.vpc.frontend_route_table_id
}

output "database_route_table_id" {
  description = "Database route table ID"
  value       = module.vpc.database_route_table_id
}

output "alb_security_group_id" {
  description = "ALB security group ID"
  value       = module.security.alb_security_group_id
}

output "ec2_security_group_id" {
  description = "EC2 security group ID"
  value       = module.security.ec2_security_group_id
}

output "s3_bucket_name" {
  description = "Static content S3 bucket name"
  value       = module.s3.bucket_name
}

output "s3_bucket_arn" {
  description = "Static content S3 bucket ARN"
  value       = module.s3.bucket_arn
}

output "iam_role_name" {
  description = "EC2 IAM role name"
  value       = module.iam.role_name
}

output "iam_role_arn" {
  description = "EC2 IAM role ARN"
  value       = module.iam.role_arn
}

output "instance_profile_name" {
  description = "EC2 instance profile name"
  value       = module.iam.instance_profile_name
}

output "ec2_instance_ids" {
  description = "EC2 instance IDs"
  value       = module.ec2.instance_ids
}

output "ec2_private_ips" {
  description = "EC2 private IP addresses"
  value       = module.ec2.private_ips
}

output "ec2_availability_zones" {
  description = "EC2 availability zones"
  value       = module.ec2.availability_zones
}

output "alb_dns_name" {
  description = "ALB DNS name"
  value       = module.alb.alb_dns_name
}

output "alb_id" {
  description = "ALB ID"
  value       = module.alb.alb_id
}

output "target_group_arn" {
  description = "Target group ARN"
  value       = module.alb.target_group_arn
}