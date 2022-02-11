#alicloud_eip_address
variable "eip_bandwidth" {
  description = "The specification of the eip bandwidth."
  type        = string
  default     = "10"
}

variable "eip_isp" {
  description = "The ISP of EIP address."
  type        = string
  default     = "BGP"
}

variable "eip_internet_charge_type" {
  description = "The specification of the eip internet charge type."
  type        = string
  default     = "PayByBandwidth"
}

variable "eip_payment_type" {
  description = "The payment type of EIP address."
  type        = string
  default     = "PayAsYouGo"
}

#alicloud_slb_load_balancer
variable "name" {
  description = "The specification of module name."
  type        = string
  default     = ""
}

variable "slb_address_type" {
  description = "The specification of the slb intranet."
  type        = string
  default     = "intranet"
}

variable "slb_spec" {
  description = "The specification of the slb spec."
  type        = string
  default     = "slb.s2.small"
}

variable "vswitch_id" {
  description = "VSwitch variables, if vswitch_id is empty, then the net_type = classic."
  type        = string
  default     = ""
}

variable "slb_tags_info" {
  description = "The specification of the slb tags info."
  type        = string
  default     = ""
}

#alicloud_instance
variable "availability_zone" {
  description = "The available zone to launch modules."
  type        = string
  default     = ""
}

variable "security_group_ids" {
  description = "A list of security group ids to associate with."
  type        = list(string)
  default     = []
}

variable "instance_type" {
  description = "The specification of the instance type."
  type        = string
  default     = ""
}

variable "system_disk_category" {
  description = "The specification of the system disk category."
  type        = string
  default     = "cloud_efficiency"
}

variable "system_disk_name" {
  description = "The specification of the system disk name."
  type        = string
  default     = ""
}

variable "system_disk_description" {
  description = "The specification of the system disk description."
  type        = string
  default     = ""
}

variable "image_id" {
  description = "The specification of the image id."
  type        = string
  default     = ""
}

variable "internet_max_bandwidth_out" {
  description = "The specification of the internet max bandwidth out."
  type        = number
  default     = 10
}

variable "data_disks_name" {
  description = "The name of the data disk."
  type        = string
  default     = ""
}

variable "ecs_size" {
  description = "The specification of the ecs size."
  type        = number
  default     = 1200
}

variable "category" {
  description = "The specification of the category."
  type        = string
  default     = "cloud_efficiency"
}

variable "description" {
  description = "The specification of module description."
  type        = string
  default     = ""
}

variable "encrypted" {
  description = "Encrypted the data in this disk."
  type        = bool
  default     = true
}

#alicloud_polardb_cluster
variable "db_type" {
  description = "Database type.Value options: MySQL, Oracle, PostgreSQL."
  type        = string
  default     = "MySQL"
}

variable "db_version" {
  description = "The specification of the db version."
  type        = string
  default     = "5.6"
}

variable "pay_type" {
  description = "The specification of the pay type."
  type        = string
  default     = "PostPaid"
}

variable "db_node_class" {
  description = "The specification of the db node class."
  type        = string
  default     = ""
}

variable "polardb_cluster_description" {
  description = "The description of cluster."
  type        = string
  default     = ""
}

#alicloud_polardb_database
variable "db_name" {
  description = "Name of the database requiring a uniqueness check."
  type        = string
  default     = ""
}

variable "engine_version" {
  description = "The specification of the engine version."
  type        = string
  default     = "5.6"
}

variable "instance_storage" {
  description = "The specification of the instance storage."
  type        = string
  default     = "30"
}

variable "instance_charge_type" {
  description = "The specification of the instance charge type."
  type        = string
  default     = "Postpaid"
}

variable "monitoring_period" {
  description = "The specification of the monitoring period."
  type        = string
  default     = "60"
}