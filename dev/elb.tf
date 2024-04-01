module "dev-elb" {
  source         = "../modules/elb"
  tgname         = "devTG"
  vpc_id         = module.dev_vpc.vpc_id
  env            = module.dev_vpc.env
  PrivateServers = module.dev_ec2.Private_instance_id
  subnets        = module.dev_vpc.Public_Subnet_Id
  nlbname        = "terraformb1-nlb"
}