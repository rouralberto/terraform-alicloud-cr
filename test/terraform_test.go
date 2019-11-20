package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestTerraformAlicloudCr(t *testing.T) {
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

	actualNamespaceId := terraform.Output(t, terraformOptions, "cr_namespace")
	actualNamespaceUser := terraform.Output(t, terraformOptions, "cr_user")
	actualAkStatus := terraform.Output(t, terraformOptions, "access_key_status")

	assert.Equal(t, varNamespace, actualNamespaceId)
	assert.Equal(t, varNamespace + "-cr-user", actualNamespaceUser)
	assert.Equal(t, "Active", actualAkStatus)
}
