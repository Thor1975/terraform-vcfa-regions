variable "vsphere_user" {
  type        = string
  description = "VMware vSphere user name"
  default     =  "administrator@vsphere.local"
}

variable "vsphere_password" {
  type        = string
  description = "VMware vSphere password"
  default     = "VMware123!VMware123!"
}
variable "vcfa_pass" {
  type        = string
  description = "vcfa admin apssword"
  default     = "VMware123!VMware123!"
}
variable "vcfa_url" {
  type        = string
  description = "vcfa URL"
  default     = "https://sa-m01-vaa01.vcf.sddc.local"
}
variable "vcfa_vcenter" {
  type        = string
  description = "vcfa vcenter"
  default     = "sa-wld01-vc01.vcf.sddc.local"
}
variable "vcfa_allow_unverified_ssl" {
  type        = string
  description = "vcfa URL"
  default     = "true"
}
variable "vsphere_server" {
  type        = string
  description = "VMware vCenter server FQDN / IP"
  default     ="sa-wld01-vc01.vcf.sddc.local"
}

variable "vsphere_datacenter" {
  type        = string
  description = "VMware vSphere datacenter"
  default="sa-wld01-DC"
}

variable "supervisor_name" {
  type        = string
  description = ""
  default = "Supervisor-02"
}
variable "supervisor_zone_name" {
  type        = string
  description = ""
  default = "vspherezone-1"
}
variable "vcfa_nsx_manager" {
  type        = string
  description = ""
  default = "sa-wld01-nsxt-vip.vcf.sddc.local"
}
variable "vcenter_storage_policy_names" {
  type        = set(string)
  description = "vCenter storage profiles"
  default = ["sa-wld01-cl01 vSAN Storage Policy"]
}
variable "tier0_gw_name" {
  type = string
  default = "sa-wld01-t0-01"
}
variable "wld_edge_cluster"{
  type = string
  default= "sa-wld01-cl01"
}






