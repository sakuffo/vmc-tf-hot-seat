variable "AWS_account" {}
variable "VMC_token" {}
variable "VMC_org_id" {}

variable "AWS_region" {}
variable "key_pair" {}


variable "MANGED_subnets" {
  default = {
    SDDC_mngt    = "10.10.0.0/23"
    SDDC_default = "192.168.100.0/24"

    VPC_attached    = "172.200.0.0/16"
    VPC_subnet_10_a = " 172.200.10.0/24"
    VPC_subnet_20_a = " 172.200.10.0/24"

  }
}

variable "VM_AMI" { default = "ami-0528a5175983e7f28" } # Amazon Linux 2 AMI (HVM), SSD Volume Type - Oregon
