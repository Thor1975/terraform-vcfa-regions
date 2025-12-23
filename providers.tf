terraform {
  required_providers {
    vcf = {
      source = "vmware/vcf"
      version = "0.17.0"
    }
    vsphere = {
    source= "vmware/vsphere"
    version = "2.14.0"
  }
  nsxt = {
     source = "vmware/nsxt"
     }
     vcfa = {
      source = "vmware/vcfa"
      version = "1.0.0"
    }

}
}
provider "vcf" {
  sddc_manager_host     = var.vcf_host
  sddc_manager_username = var.vcf_user
  sddc_manager_password = var.vcf_password
  allow_unverified_tls  = var.allow_unverified_tls
}

provider "vsphere" {
   user = var.vsphere_user
   password = var.vsphere_password
   vsphere_server = var.vsphere_server
   allow_unverified_ssl =true
   }
   
provider "nsxt" {
       host      =var.nsxt_server
       username   =var.nsxt_user
       password   =var.nsxt_password
       allow_unverified_ssl = true
       max_retries =2
       }

provider "vcfa" {
  user                 = "admin"
  password             = var.vcfa_pass
  auth_type            = "integrated"
  org                  = "System"
  url                  = var.vcfa_url
  allow_unverified_ssl = var.vcfa_allow_unverified_ssl
  logging              = true # Enables logging
  logging_file         = "vcfa.log"
}

# Fetch the VCFA version
data "vcfa_version" "version" {
  condition         = ">= 9.0.0"
  fail_if_not_match = false
}