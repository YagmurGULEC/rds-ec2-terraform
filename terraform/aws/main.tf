
module "network" {
  source                = "../modules/network"
  region                = var.region
  project_name          = var.project_name
  availability_zone_1   = var.availability_zone_1
  availability_zone_2   = var.availability_zone_2
  vpc_cidr              = var.vpc_cidr
  public_subnet_cidr    = var.public_subnet_cidr
  private_subnet_cidr_1 = var.private_subnet_cidr_1
  private_subnet_cidr_2 = var.private_subnet_cidr_2
}


module "bastion" {
  source = "../modules/bastion"

  region              = var.region
  vpc_id              = module.network.vpc_id
  public_subnet_1     = module.network.public_subnet_id
  availability_zone_1 = var.availability_zone_1
  project_name        = var.project_name

  instance_type = var.instance_type
  key_name      = var.key_name
  ami_id        = var.ami_id

}


module "rds" {
  source              = "../modules/rds"
  region              = var.region
  project_name        = var.project_name
  vpc_id              = module.network.vpc_id
  private_subnet_1    = module.network.private_subnet_id_1
  private_subnet_2    = module.network.private_subnet_id_2
  availability_zone_1 = var.availability_zone_1
  availability_zone_2 = var.availability_zone_2

  db_name       = var.db_name
  db_username   = var.db_username
  db_password   = var.db_password
  bastion_sg_id = module.bastion.bastion_sg_id

}

