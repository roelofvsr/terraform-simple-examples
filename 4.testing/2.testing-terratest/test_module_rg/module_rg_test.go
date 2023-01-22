package test

import (
	"github.com/gruntwork-io/terratest/modules/terraform"
	"testing"
)

func TestTerraformKeyVault(t *testing.T) {
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "./terra_config",
	})
	defer terraform.Destroy(t, terraformOptions)
	terraform.InitAndApply(t, terraformOptions)
	//output := terraform.Output(t, terraformOptions, "testing rg module")
	//assert.Equal(t, "testing rg module", output)
}
