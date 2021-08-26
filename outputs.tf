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

output "this_polardb_database_id" {
  value = alicloud_polardb_database.default.id
}

output "this_slb_id" {
  value = alicloud_slb_load_balancer.default.id
}

output "this_eip_id" {
  value = alicloud_eip.default.id
}

output "this_zone_id" {
  value = data.alicloud_zones.default.zones[0].id
}
