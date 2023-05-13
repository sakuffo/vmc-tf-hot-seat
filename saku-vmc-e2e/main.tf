provider "aws" {
  region = var.AWS_region
}

provider "vmc" {
  refresh_token = var.vmc_token
  org_id        = var.my_org_id
}

terraform {
  backend "local" {
    path = "../../phase1.tfstate"
  }
}
