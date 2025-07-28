module "vpc" {
  source       = "./modules/vpc"
  vpc_cidr     = "10.0.0.0/16"
  vpc_tags     = { Name = "Main VPC" }
  subnet1_tags = { Name = "Subnet 1" }
  subnet2_tags = { Name = "Subnet 2" }
}
