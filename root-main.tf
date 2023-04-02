terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}


module "vpc" {
  source = "./vpc"
}

module "sg" {
  source = "./sg"

  vpc_id = module.vpc.vpc_tf_id
}

module "ec2" {
  source = "./ec2"

  vpc_id     = module.vpc.vpc_tf_id
  sn_pub_id  = module.vpc.vpc_tf_sn_pub_id
  sn_priv_id = module.vpc.vpc_tf_sn_priv_id
  sg_id      = module.sg.vpc_tf_sg_id

}