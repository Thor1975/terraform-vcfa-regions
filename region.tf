# Create a Region

data "vcfa_vcenter" "wldvc"{
  name =var.vcfa_vcenter
}
data "vcfa_nsx_manager" "wldnsx"{
  name =var.vcfa_nsx_manager
}

# https://registry.terraform.io/providers/vmware/vcfa/latest/docs/data-sources/supervisor
data "vcfa_supervisor" "supervisor-02" {
  name       = var.supervisor_name
  vcenter_id = data.vcfa_vcenter.wldvc.id
}
# https://registry.terraform.io/providers/vmware/vcfa/latest/docs/data-sources/supervisor_zone

# https://registry.terraform.io/providers/vmware/vcfa/latest/docs/resources/region
resource "vcfa_region" "us-west" {
  name                 = "us-west"
  description          = "Created by Terraform VCFA Provider"
  nsx_manager_id       = data.vcfa_nsx_manager.wldnsx.id
  supervisor_ids       = [data.vcfa_supervisor.supervisor-02.id]
  storage_policy_names = var.vcenter_storage_policy_names[*]
}

data "vcfa_region_vm_class" "vm_class" {
  name      = "best-effort-large"
  region_id = vcfa_region.us-west.id
  }

data "vcfa_region_vm_class" "vm_class2" {
  name      = "best-effort-small"
  region_id = vcfa_region.us-west.id
}