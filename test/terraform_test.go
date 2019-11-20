package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestTerraformAlicloudCr(t *testing.T) {
    t.Logf("Testing terraform-alicloud-cr module...")

	t.Parallel()

	varNamespace := "cr_repo_namespace"

	terraformOptions := &terraform.Options{
		TerraformDir: "../",
		Vars: map[string]interface{}{
			"namespace": varNamespace,
		},
		NoColor: true,
	}

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)
}
