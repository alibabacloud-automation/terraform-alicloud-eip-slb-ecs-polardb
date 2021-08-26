package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

// An example of how to test the simple Terraform module in examples/terraform-basic-example using Terratest.
// Make sure you have the dep binary, https://github.com/golang/dep
// Run 'dep ensure' before run test cases.

func TestTerraformBasicExampleNew(t *testing.T) {
	t.Parallel()
	name := "tf-eip-slb-ecs-rds"
	description := "tf-eip-slb-ecs-rds-description"
	availableDiskCategory := "cloud_efficiency"
	availableResourceCreation := "PolarDB"
	vpcCidrBlock := "192.168.0.0/16"
	vswitchCidrBlock := "192.168.1.0/24"
	instanceType := "ecs.n4.large"
	systemDiskCategory := "cloud_efficiency"
	systemDiskName := "system_disk"
	systemDiskDescription := "system_disk_description"
	imageId := "ubuntu_18_04_64_20G_alibase_20190624.vhd"
	internetMaxBandwidthOut := 10
	ecsSize := 1200
	category := "cloud_efficiency"
	securityIps := []string{"127.0.0.1"}
	engine := "MySQL"
	engineVersion := "5.6"
	rdsInstanceType := "rds.mysql.s2.large"
	instanceStorage := "30"
	instanceChargeType := "Postpaid"
	monitoringPeriod := "60"
	slbAddressType := "intranet"
	slbSpec := "slb.s2.small"
	slbTagsInfo := "create for internet"
	eipBandwidth := "10"
	eipInternetChargeType := "PayByBandwidth"

	terraformOptions := &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: "./basic/",

		// Variables to pass to our Terraform code using -var options
		Vars: map[string]interface{}{
			"name":                        name,
			"description":                 description,
			"available_disk_category":     availableDiskCategory,
			"available_resource_creation": availableResourceCreation,
			"vpc_cidr_block":              vpcCidrBlock,
			"vswitch_cidr_block":          vswitchCidrBlock,
			"instance_type":               instanceType,
			"system_disk_category":        systemDiskCategory,
			"system_disk_name":            systemDiskName,
			"system_disk_description":     systemDiskDescription,
			"image_id":                    imageId,
			"internet_max_bandwidth_out":  internetMaxBandwidthOut,
			"ecs_size":                    ecsSize,
			"category":                    category,
			"security_ips":                securityIps,
			"engine":                      engine,
			"engine_version":              engineVersion,
			"rds_instance_type":           rdsInstanceType,
			"instance_storage":            instanceStorage,
			"instance_charge_type":        instanceChargeType,
			"monitoring_period":           monitoringPeriod,
			"slb_address_type":            slbAddressType,
			"slb_spec":                    slbSpec,
			"slb_tags_info":               slbTagsInfo,
			"eip_bandwidth":               eipBandwidth,
			"eip_internet_charge_type":    eipInternetChargeType,
		},

		// Disable colors in Terraform commands, so it's easier to parse stdout/stderr
		NoColor: true,
	}

	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)

	// Run `terraform output` to get the values of output variables
	thisEcsName := terraform.Output(t, terraformOptions, "this_ecs_name")
	thisEcsInstanceType := terraform.Output(t, terraformOptions, "this_ecs_instance_type")
	thisDbInstanceType := terraform.Output(t, terraformOptions, "this_db_instance_type")
	thisSlbAddressType := terraform.Output(t, terraformOptions, "this_slb_address_type")
	thisEipInternetChargeType := terraform.Output(t, terraformOptions, "this_eip_internet_charge_type")

	// Verify we're getting back the outputs we expect
	assert.Equal(t, thisEcsName, name)
	assert.Equal(t, thisEcsInstanceType, instanceType)
	assert.Equal(t, thisDbInstanceType, thisDbInstanceType)
	assert.Equal(t, thisSlbAddressType, slbAddressType)
	assert.Equal(t, thisEipInternetChargeType, eipInternetChargeType)
}
