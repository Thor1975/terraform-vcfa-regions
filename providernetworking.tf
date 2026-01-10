resource "vcfa_ip_space" "uswest_ip_space"{
    name = "uswest_ip_space"
    region_id = vcfa_region.us-west.id
    external_scope = "10.10.10.50/28"
    default_quota_max_subnet_size = 24
    default_quota_max_cidr_count = 1
    default_quota_max_ip_count = 1


internal_scope{
    name = "scope1"
    cidr = "10.0.0.0/24"
}
}
resource "vcfa_provider_gateway" "uswest_provider_gw" {
name = "uswest_provider_gw"
region_id = vcfa_region.us-west.id
tier0_gateway_id = data.vcfa_tier0_gateway.sa-wld01-t0-01.id
ip_space_ids = [ vcfa_ip_space.uswest_ip_space.id ]
}
data "vcfa_tier0_gateway" "sa-wld01-t0-01"{
    name = "sa-wld01-t0-01"
    region_id = vcfa_region.us-west.id
}

