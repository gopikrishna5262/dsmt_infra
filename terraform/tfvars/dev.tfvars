aws_region = "ap-south-1"

project_name = "devops-assessment"

vpc_cidr = "10.0.0.0/16"

availability_zones = [
  "ap-south-1a",
  "ap-south-1b",
  "ap-south-1c"
]

frontend_subnet_cidrs = [
  "10.0.1.0/24",
  "10.0.2.0/24",
  "10.0.3.0/24"
]

backend_subnet_cidrs = [
  "10.0.11.0/24",
  "10.0.12.0/24",
  "10.0.13.0/24"
]

database_subnet_cidrs = [
  "10.0.21.0/24",
  "10.0.22.0/24",
  "10.0.23.0/24"
]

ami_id         = "ami-0aa761682283b4cc8"
instance_type  = "t3.micro"
instance_count = 3