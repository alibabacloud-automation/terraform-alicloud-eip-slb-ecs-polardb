#alicloud_eip_address
variable "eip_bandwidth" {
  description = "The specification of the eip bandwidth."
  type        = string
  default     = "10"
}

#alicloud_slb_load_balancer
variable "name" {
  description = "The specification of module name."
  type        = string
  default     = "tf-eip-slb-ecs-polardb"
}

variable "slb_spec" {
  description = "The specification of the slb spec."
  type        = string
  default     = "slb.s2.small"
}

variable "slb_tags_info" {
  description = "The specification of the slb tags info."
  type        = string
  default     = "slb-tag-info"
}

#alicloud_instance
variable "system_disk_name" {
  description = "The specification of the system disk name."
  type        = string
  default     = "system_disk"
}

variable "system_disk_description" {
  description = "The specification of the system disk description."
  type        = string
  default     = "system_disk_description"
}

variable "internet_max_bandwidth_out" {
  description = "The specification of the internet max bandwidth out."
  type        = number
  default     = 10
}

#alicloud_polardb_cluster
variable "pay_type" {
  description = "The specification of the pay type."
  type        = string
  default     = "PostPaid"
}

variable "polardb_cluster_description" {
  description = "The description of cluster."
  type        = string
  default     = "tf-polardb-description"
}