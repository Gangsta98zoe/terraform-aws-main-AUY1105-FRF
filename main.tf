terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "networking" {
  source              = "github.com/Gangsta98zoe/terraform-module-networking?ref=v0.1.0"
  vpc_cidr_block      = var.vpc_cidr_block
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  environment         = var.environment
  name_prefix         = var.name_prefix
}

module "compute" {
  source        = "github.com/Gangsta98zoe/terraform-module-compute?ref=v0.1.0"
  vpc_id        = module.networking.vpc_id
  subnet_id     = module.networking.public_subnet_id
  instance_type = var.instance_type
  environment   = var.environment
  name_prefix   = var.name_prefix
}

module "storage" {
  source      = "github.com/Gangsta98zoe/terraform-module-storage?ref=v0.1.0"
  environment = var.environment
  name_prefix = var.name_prefix
}
