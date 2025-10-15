provider "alicloud" {
  region = "ap-southeast-5"
}
data "alicloud_polardb_zones" "default" {
}

locals {
  zone_id = data.alicloud_polardb_zones.default.zones[0].id
}

data "alicloud_images" "default" {
  most_recent   = true
  instance_type = data.alicloud_instance_types.default.instance_types[0].id
}

data "alicloud_instance_types" "default" {
  availability_zone    = local.zone_id
  cpu_core_count       = 2
  memory_size          = 8
  instance_type_family = "ecs.g9i"
}

data "alicloud_polardb_node_classes" "default" {
  pay_type   = var.pay_type
  db_type    = "MySQL"
  db_version = "5.6"
  zone_id    = local.zone_id
}

module "vpc" {
  source  = "alibaba/vpc/alicloud"
  version = "~>1.11"

  create             = true
  vpc_name           = var.name
  vpc_cidr           = "172.16.0.0/16"
  vswitch_name       = var.name
  vswitch_cidrs      = ["172.16.0.0/21"]
  availability_zones = [local.zone_id]
}

module "security_group" {
  source  = "alibaba/security-group/alicloud"
  version = "~>2.4"

  vpc_id = module.vpc.this_vpc_id
}

module "example" {
  source = "../.."

  #alicloud_eip_address
  eip_bandwidth            = var.eip_bandwidth
  eip_isp                  = "BGP"
  eip_internet_charge_type = "PayByBandwidth"
  eip_payment_type         = "PayAsYouGo"

  #alicloud_slb_load_balancer
  name             = var.name
  slb_address_type = "intranet"
  slb_spec         = var.slb_spec
  vswitch_id       = module.vpc.this_vswitch_ids[0]
  slb_tags_info    = var.slb_tags_info

  #alicloud_instance
  availability_zone          = local.zone_id
  security_group_ids         = [module.security_group.this_security_group_id]
  instance_type              = data.alicloud_instance_types.default.instance_types[0].id
  system_disk_category       = "cloud_essd"
  system_disk_name           = var.system_disk_name
  system_disk_description    = var.system_disk_description
  image_id                   = data.alicloud_images.default.images[0].image_id
  internet_max_bandwidth_out = var.internet_max_bandwidth_out
  ecs_size                   = 1200
  data_disks_name            = "data_disks_name"
  category                   = "cloud_essd"
  description                = "tf-vpc-ecs-description"
  encrypted                  = true

  #alicloud_polardb_cluster
  db_type                     = "MySQL"
  db_version                  = "5.6"
  pay_type                    = var.pay_type
  db_node_class               = data.alicloud_polardb_node_classes.default.classes[0].supported_engines[0].available_resources[0].db_node_class
  polardb_cluster_description = var.polardb_cluster_description

  #alicloud_polardb_database
  db_name = "tf-db-name"

}