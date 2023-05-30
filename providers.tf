terraform {
  required_providers {
    vmc = {
      source  = "vmware/vmc"
      version = "1.13.0"
    }
    vsphere = {
      source  = "hashicorp/vsphere"
      version = "2.4.0"
    }
  }
}
