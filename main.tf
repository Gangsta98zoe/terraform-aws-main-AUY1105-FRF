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

module "vpc" {
  source              = "github.com/Gangsta98zoe/terraform-aws-vpc-AUY1105-FRF?ref=v1.1.0"
  vpc_cidr_block      = var.vpc_cidr_block
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  environment         = var.environment
  name_prefix         = var.name_prefix
}

module "ec2" {
  source        = "github.com/Gangsta98zoe/terraform-aws-ec2-AUY1105-FRF?ref=v1.0.0"
  vpc_id        = module.vpc.vpc_id
  subnet_id     = module.vpc.public_subnet_id
  instance_type = var.instance_type
  environment   = var.environment
  name_prefix   = var.name_prefix
}

module "s3" {
  source      = "github.com/Gangsta98zoe/terraform-aws-s3-AUY1105-FRF?ref=v1.1.0"
  environment = var.environment
  name_prefix = var.name_prefix
}
