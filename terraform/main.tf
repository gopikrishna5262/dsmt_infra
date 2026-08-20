module "vpc" {
  source = "./modules/vpc"

  project_name = var.project_name
  vpc_cidr     = var.vpc_cidr

  availability_zones    = var.availability_zones
  frontend_subnet_cidrs = var.frontend_subnet_cidrs
  backend_subnet_cidrs  = var.backend_subnet_cidrs
  database_subnet_cidrs = var.database_subnet_cidrs
}

module "security" {
  source = "./modules/security"

  project_name = var.project_name
  vpc_id       = module.vpc.vpc_id
}

module "s3" {
  source = "./modules/s3"

  project_name = var.project_name
}

module "iam" {
  source = "./modules/iam"

  project_name  = var.project_name
  s3_bucket_arn = module.s3.bucket_arn
}

module "ec2" {
  source = "./modules/ec2"

  project_name = var.project_name

  ami_id         = var.ami_id
  instance_type  = var.instance_type
  instance_count = var.instance_count

  subnet_ids = module.vpc.backend_subnet_ids

  security_group_id = module.security.ec2_security_group_id

  instance_profile_name = module.iam.instance_profile_name
}

module "alb" {
  source = "./modules/alb"

  project_name = var.project_name

  vpc_id = module.vpc.vpc_id

  subnet_ids = module.vpc.frontend_subnet_ids

  security_group_id = module.security.alb_security_group_id

  target_instance_ids = module.ec2.instance_ids
}