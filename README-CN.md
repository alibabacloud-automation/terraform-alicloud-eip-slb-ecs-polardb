Terraform module which creates web service with EIP&SLB&ECS&PolarDB on Alibaba Cloud

terraform-alicloud-eip-slb-ecs-polardb
=====================================================================

[English](README.md) | 简体中文

本 Module 用于在阿里云的 VPC 下创建一个轻量级 WEB 服务，包含：EIP、 SLB、 ECS、RDS。

本 Module 支持创建以下资源:

* [alicloud_instance](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/instance)
* [alicloud_polardb_cluster](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/polardb_cluster)
* [alicloud_polardb_database](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/polardb_database)
* [alicloud_slb_load_balancer](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/slb_load_balancer)
* [alicloud_eip](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/eip)

## 用法

```hcl
module "eip-slb-ecs-polardb" {
  source           = "terraform-alicloud-modules/eip-slb-ecs-polardb/alicloud"
  profile          = "Your-Profile-Name"
  region           = "cn-shenzhen"
  name             = "tf-eip-slb-ecs-polardb"
  instance_type    = "ecs.n4.large"
  db_node_class    = "polar.mysql.x4.large"
  slb_address_type = "intranet"
}
```

## 注意事项

* 本 Module 使用的 AccessKey 和 SecretKey 可以直接从 `profile` 和 `shared_credentials_file`
  中获取。如果未设置，可通过下载安装 [aliyun-cli](https://github.com/aliyun/aliyun-cli#installation) 后进行配置.

## 提交问题

如果在使用该 Terraform Module
的过程中有任何问题，可以直接创建一个 [Provider Issue](https://github.com/aliyun/terraform-provider-alicloud/issues/new)，我们将根据问题描述提供解决方案。

**注意:** 不建议在该 Module 仓库中直接提交 Issue。

## 作者

Created and maintained by Will(ppnjy@qq.com)

## 许可

MIT Licensed. See LICENSE for full details.

## 参考

* [Terraform-Provider-Alicloud Github](https://github.com/aliyun/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs)
