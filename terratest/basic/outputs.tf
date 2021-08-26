output "this_vpc_id" {
  value = alicloud_vpc.default.id
}

output "this_vswitch_id" {
  value = alicloud_vswitch.default.id
}

output "this_security_group_id" {
  value = alicloud_security_group.default.id
}

output "this_ecs_id" {
  value = alicloud_instance.default.id
}

output "this_zone_id" {
  value = data.alicloud_zones.default.zones[0].id
}

output "this_ecs_name" {
  value = alicloud_instance.default.instance_name
}

output "this_ecs_instance_type" {
  value = alicloud_instance.default.instance_type
}

output "this_db_instance_type" {
  value = alicloud_db_instance.default.instance_type
}

output "this_slb_address_type" {
  value = alicloud_slb_load_balancer.default.address_type
}

output "this_eip_internet_charge_type" {
  value = alicloud_eip.default.internet_charge_type
}
