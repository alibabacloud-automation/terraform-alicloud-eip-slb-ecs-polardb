output "this_ecs_id" {
  description = "The ID of the ECS instance."
  value       = alicloud_instance.default.id
}

output "this_ecs_name" {
  description = "The name of the ECS instance."
  value       = alicloud_instance.default.instance_name
}

output "this_polardb_database_id" {
  description = "The ID of the PolarDB database."
  value       = alicloud_polardb_database.default.id
}

output "this_polardb_database_name" {
  description = "The name of the PolarDB database."
  value       = alicloud_polardb_database.default.db_name
}

output "this_slb_id" {
  description = "The ID of the SLB instance."
  value       = alicloud_slb_load_balancer.default.id
}

output "this_slb_name" {
  description = "The name of the SLB instance."
  value       = alicloud_slb_load_balancer.default.load_balancer_name
}

output "this_eip_id" {
  description = "The ID of the EIP instance."
  value       = alicloud_eip_address.default.id
}