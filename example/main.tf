module "tf-eip-slb-ecs-polardb" {
  source           = "../"
  name             = "tf-eip-slb-ecs-rds"
  instance_type    = "ecs.n4.large"
  db_node_class    = "polar.mysql.x4.large"
  slb_address_type = "intranet"
}
