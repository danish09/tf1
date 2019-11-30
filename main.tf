provider "aws" {
  region = "eu-west-1"
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "all" {
  vpc_id = data.aws_vpc.default.id
}

data "aws_security_group" "default" {
  name   = "default"
  vpc_id = data.aws_vpc.default.id
}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners = ["amazon"]

  filter {
    name = "name"

    values = [
      "amzn-ami-hvm-*-x86_64-gp2"
    ]
  }

  filter {
    name = "owner-alias"

    values = [
      "amazon"
    ]
  }
}



module "security_group" {
  source  = "./modules/security-group"
  name        = "terraform_asso_sg"
  vpc_id      = data.aws_vpc.default.id
}

module "ec2" {
  source = "./modules/instance"
  instance_count = 1
  name          = "asso-ec2"
  ami           = data.aws_ami.amazon_linux.id
  vpc_security_group_ids      = ["${module.security_group.asso_sg_id}"]
}



