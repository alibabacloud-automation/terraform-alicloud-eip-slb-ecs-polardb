#alicloud_eip_address
eip_bandwidth = 20

#alicloud_slb_load_balancer
name          = "update-tf-eip-slb-ecs-polardb"
slb_spec      = "slb.s3.small"
slb_tags_info = "update-slb-tag-info"

#alicloud_instance
system_disk_name           = "test_system_disk"
system_disk_description    = "test_system_disk_description"
internet_max_bandwidth_out = "20"

#alicloud_polardb_cluster
polardb_cluster_description = "update-tf-polardb-description"