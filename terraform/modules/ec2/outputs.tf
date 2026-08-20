output "instance_ids" {
  description = "EC2 instance IDs"
  value       = aws_instance.this[*].id
}

output "private_ips" {
  description = "Private IP addresses of EC2 instances"
  value       = aws_instance.this[*].private_ip
}

output "availability_zones" {
  description = "Availability zones of EC2 instances"
  value       = aws_instance.this[*].availability_zone
}