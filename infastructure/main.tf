provider "aws" {
    region = "us-east-2"
}

locals {
  environment      = "dev-local"
  application_name = "budgeting"
}

# Setup Networking
module "networking" {
  source = "./modules"
  environment = "${local.environment}"
  application_name = "${local.application_name}"
}
