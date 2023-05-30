terraform {
  required_providers {
    vmc = {
      source  = "vmware/vmc"
      version = "1.13.0"
    }
  }
}

#
# The first step is to configure the provider to connect to Cloud Service
# Provider.

provider "vmc" {
  refresh_token = var.api_token
  org_id        = var.org_id
}

# data "vmc_connected_accounts" "my_accounts" {
#   account_number = var.aws_account_number
# }

# data "vmc_customer_subnets" "my_subnets" {
#   connected_account_id = data.vmc_connected_accounts.my_accounts.id
#   region               = var.sddc_region
# }

resource "vmc_sddc" "sddc_1" {
  sddc_name           = var.sddc_name
  vpc_cidr            = var.vpc_cidr
  num_host            = var.sddc_num_hosts
  provider_type       = "AWS"
  region              = "us-west-2"
  vxlan_subnet        = var.vxlan_subnet
  delay_account_link  = true
  skip_creating_vxlan = false
  host_instance_type  = "I3_METAL"
  sso_domain          = "vmc.local"
  sddc_type           = "1NODE"
  deployment_type     = "SingleAZ"

  # account_link_sddc_config {
  #   customer_subnet_ids  = [data.vmc_customer_subnets.my_subnets.ids[0]]
  #   connected_account_id = data.vmc_connected_accounts.my_accounts.id
  # }
  timeouts {
    create = "300m"
    update = "300m"
    delete = "180m"
  }
  microsoft_licensing_config {
    mssql_licensing   = "ENABLED"
    windows_licensing = "DISABLED"
  }
}

resource "vmc_public_ip" "public_ip_1" {
  nsxt_reverse_proxy_url = vmc_sddc.sddc_1.nsxt_reverse_proxy_url
  display_name           = var.public_ip_displayname
}
