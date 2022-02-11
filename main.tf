resource "alicloud_eip_address" "default" {
  bandwidth            = var.eip_bandwidth
  isp                  = var.eip_isp
  internet_charge_type = var.eip_internet_charge_type
  payment_type         = var.eip_payment_type
}

resource "alicloud_slb_load_balancer" "default" {
  load_balancer_name = var.name
  address_type       = var.slb_address_type
  load_balancer_spec = var.slb_spec
  vswitch_id         = var.vswitch_id
  tags = {
    info = var.slb_tags_info
  }
}

resource "alicloud_instance" "default" {
  instance_name              = var.name
  availability_zone          = var.availability_zone
  security_groups            = var.security_group_ids
  vswitch_id                 = var.vswitch_id
  instance_type              = var.instance_type
  system_disk_category       = var.system_disk_category
  system_disk_name           = var.system_disk_name
  system_disk_description    = var.system_disk_description
  image_id                   = var.image_id
  internet_max_bandwidth_out = var.internet_max_bandwidth_out
  data_disks {
    name        = var.data_disks_name
    size        = var.ecs_size
    category    = var.category
    description = var.description
    encrypted   = var.encrypted
  }
}

resource "alicloud_polardb_cluster" "default" {
  db_type       = var.db_type
  db_version    = var.db_version
  pay_type      = var.pay_type
  db_node_class = var.db_node_class
  vswitch_id    = var.vswitch_id
  description   = var.description == "" ? var.polardb_cluster_description : var.description
}

resource "alicloud_polardb_database" "default" {
  db_cluster_id = alicloud_polardb_cluster.default.id
  db_name       = var.db_name == "" ? var.name : var.db_name
}