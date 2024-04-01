module "dev_vpc" {
  source             = "../modules/network"
  vpc_cidr           = "10.100.0.0/16"
  vpc_name           = "Dev_B1"
  Publicsubnet_cidr  = ["10.100.1.0/24", "10.100.2.0/24", "10.100.3.0/24"]
  Privatesubnet_cidr = ["10.100.10.0/24", "10.100.20.0/24", "10.100.30.0/24"]
  az                 = ["us-east-1a", "us-east-1b", "us-east-1c"]
  env                = "Dev"
  nat_gw             = module.dev_nat.natgwid
}