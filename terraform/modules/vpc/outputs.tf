output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.this.id
}

output "vpc_cidr" {
  description = "CIDR block of the VPC"
  value       = aws_vpc.this.cidr_block
}

output "frontend_subnet_ids" {
  description = "Frontend subnet IDs"
  value       = aws_subnet.frontend[*].id
}

output "backend_subnet_ids" {
  description = "Backend subnet IDs"
  value       = aws_subnet.backend[*].id
}

output "database_subnet_ids" {
  description = "Database subnet IDs"
  value       = aws_subnet.database[*].id
}
output "frontend_route_table_id" {
  description = "Frontend route table ID"
  value       = aws_route_table.frontend.id
}
output "nat_gateway_id" {
  description = "NAT Gateway ID"
  value       = aws_nat_gateway.this.id
}

output "nat_eip" {
  description = "Elastic IP associated with NAT Gateway"
  value       = aws_eip.nat.public_ip
}

output "backend_route_table_id" {
  description = "Backend route table ID"
  value       = aws_route_table.backend.id
}

output "database_route_table_id" {
  description = "Database route table ID"
  value       = aws_route_table.database.id
}