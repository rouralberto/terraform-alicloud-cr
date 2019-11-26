package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/gruntwork-io/terratest/modules/files"
	"github.com/stretchr/testify/assert"
)

func TestTerraformAlicloudCr(t *testing.T) {
	t.Parallel()

	// The name for the namespace is the only required variable
	varNamespace         := "cr_repo_namespace"
	varDefaultRepository := "default"

	// Context for the terraform module files
	varTerraformDir := "../"

	terraformOptions := &terraform.Options{
		TerraformDir: varTerraformDir,
		Vars: map[string]interface{}{
			"namespace": varNamespace,
		},
		NoColor: true,
	}

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	// Reading the outputs from the cr module
	actualNamespaceId      := terraform.Output(t, terraformOptions, "cr_namespace")
	actualNamespaceUser    := terraform.Output(t, terraformOptions, "cr_user")
	actualAkStatus         := terraform.Output(t, terraformOptions, "access_key_status")
	actualRepositoryIds    := terraform.Output(t, terraformOptions, "repository_ids")
	actualRamUser          := terraform.Output(t, terraformOptions, "ram_user")
	actualPolicyName       := terraform.Output(t, terraformOptions, "ram_policy_name")
	actualPolicyType       := terraform.Output(t, terraformOptions, "ram_policy_type")
	actualPolicyAttachment := terraform.Output(t, terraformOptions, "ram_policy_attachment")

	// Expected outputs
	expectedNamespaceId      := varNamespace
	expectedUserName         := varNamespace + "-cr-user"
	expectedPolicyName       := varNamespace + "-cr-policy"
	expectedPolicyAttachment := "user:" + actualPolicyName + ":" + actualPolicyType + ":" + actualRamUser
	expectedRepositoryIds    := "[\n  \"" + varNamespace + "/" + varDefaultRepository + "\",\n]"
	expectedAkStatus         := "Active"
	expectedAkFileName       := "cr-" + varNamespace + "-ak.json"

	// Tests against expected values from created resources in the cr module
	assert.Equal(t, expectedNamespaceId, actualNamespaceId)
	assert.Equal(t, expectedUserName, actualNamespaceUser)
	assert.Equal(t, expectedUserName, actualRamUser)
	assert.Equal(t, expectedRepositoryIds, actualRepositoryIds)
	assert.Equal(t, expectedPolicyName, actualPolicyName)
	assert.Equal(t, expectedPolicyAttachment, actualPolicyAttachment)
	assert.Equal(t, expectedAkStatus, actualAkStatus)

	// Tests whether the credentials file for the end-user exists or not
	files.FileExists(varTerraformDir + expectedAkFileName)
}
