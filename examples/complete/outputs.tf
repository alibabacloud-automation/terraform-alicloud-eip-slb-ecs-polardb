output "this_ecs_name" {
  description = "The name of the ECS instance."
  value       = module.example.this_ecs_name
}

output "this_polardb_database_name" {
  description = "The name of the PolarDB database."
  value       = module.example.this_polardb_database_name
}

output "this_slb_name" {
  description = "The name of the SLB."
  value       = module.example.this_slb_name
}