module "dev_nat" {
  source         = "../modules/nat"
  publicsubnet_1 = module.dev_vpc.Public_subnet_1
  vpc_name       = module.dev_vpc.vpc_name
}
