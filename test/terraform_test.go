package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestTerraformAlicloudCr(t *testing.T) {
	t.Parallel()

    // The name for the namespace, only required variable
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

    // Reading the outputs from the cr module
	actualNamespaceId := terraform.Output(t, terraformOptions, "cr_namespace")
	actualNamespaceUser := terraform.Output(t, terraformOptions, "cr_user")
	actualRamUser := terraform.Output(t, terraformOptions, "ram_user")
	actualRamPolicyName := terraform.Output(t, terraformOptions, "ram_policy_name")
	actualAkStatus := terraform.Output(t, terraformOptions, "access_key_status")

    // Tests against expected values from created resources in the cr module
	assert.Equal(t, varNamespace, actualNamespaceId)
	assert.Equal(t, varNamespace + "-cr-user", actualNamespaceUser)
	assert.Equal(t, varNamespace + "-cr-user", actualRamUser)
	assert.Equal(t, varNamespace + "-cr-policy", actualRamPolicyName)
	assert.Equal(t, "Active", actualAkStatus)
}
