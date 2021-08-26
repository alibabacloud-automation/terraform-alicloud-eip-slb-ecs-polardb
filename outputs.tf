output "this_ecs_id" {
  value = alicloud_instance.default.id
}

output "this_ecs_name" {
  value = alicloud_instance.default.instance_name
}

output "this_polardb_database_id" {
  value = alicloud_polardb_database.default.id
}

output "this_polardb_database_name" {
  value = alicloud_polardb_database.default.db_name
}

output "this_slb_id" {
  value = alicloud_slb_load_balancer.default.id
}

output "this_slb_name" {
  value = alicloud_slb_load_balancer.default.load_balancer_name
}

output "this_eip_id" {
  value = alicloud_eip.default.id
}
