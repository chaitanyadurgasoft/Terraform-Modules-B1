module "Prod_vpc" {
  source             = "../modules/network"
  vpc_cidr           = "10.200.0.0/16"
  vpc_name           = "Prod_B1"
  Publicsubnet_cidr  = ["10.200.1.0/24", "10.200.2.0/24", "10.200.3.0/24"]
  Privatesubnet_cidr = ["10.200.10.0/24", "10.200.20.0/24", "10.200.30.0/24"]
  az                 = ["us-east-2a", "us-east-2b", "us-east-2c"]
  env                = "Prod"
   nat_gw             = module.dev_nat.natgwid
}