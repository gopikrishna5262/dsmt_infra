terraform {
  backend "s3" {
    bucket       = "dsmt-tf-state"
    key          = "default/terraform.tfstate"
    region       = "ap-south-1"
    use_lockfile = true
  }
}