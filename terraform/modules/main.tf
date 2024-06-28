provider "aws" {
  region  = "us-east-1"
  profile = "B-34"
}

module "ec2" {
  source        = "./module/ec2/"
  ami_id        = var.ami_id
  instance_type = var.instance_type
  key_name      = "B-34"
  instance_name = "server-1"
}


module "vpc" {
  source      = "./module/vpc/"
  vpc_cidr_block  = var.vpc_cidr_block
  vpc_name    = var.vpc_name
  subnet_cidr_block   = var.subnet_cidr_block
  subnet_az   = var.subnet_az
  public_ip   = var.public_ip
  subnet_name = var.subnet_name
  igw_name    = var.igw_name
  ports       = var.ports
}
