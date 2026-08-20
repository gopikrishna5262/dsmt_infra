variable "project_name" {
  description = "Project name"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "subnet_ids" {
  description = "Backend subnet IDs"
  type        = list(string)
}

variable "security_group_id" {
  description = "EC2 security group ID"
  type        = string
}

variable "instance_profile_name" {
  description = "IAM instance profile name"
  type        = string
}

variable "instance_count" {
  description = "Number of EC2 instances"
  type        = number
}