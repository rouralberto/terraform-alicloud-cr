# Alicloud Container Registry Terraform Module
A terraform module to create a private Container Registry namespace and a RAM role able to pull/push from the namespace
created.

**NOTE:** This module uses _AccessKey_ and _SecretKey_ from `profile` and `shared_credentials_file`. If you have not set
them yet, please install [aliyun-cli](https://github.com/aliyun/aliyun-cli#installation) and configure it.

***Read this in other languages:*** [English](https://github.com/roura356a/terraform-alicloud-cr/blob/master/README.md),
[Español](https://github.com/roura356a/terraform-alicloud-cr/blob/master/README.es-ES.md),
[简体中文](https://github.com/roura356a/terraform-alicloud-cr/blob/master/README.zh-CN.md).

----------------------


## Usage
```hcl
provider "alicloud" {}

module "cr" {
  source  = "roura356a/cr/alicloud"
  version = "1.3.0"
  
  namespace = "cr_repo_namespace"
}
```

After running `terraform apply`, a file called `cr-{namespace}-ak.json` will be generated with the _AccessKey_ &
_SecretKey_ needed to query the `GetAuthorizationToken` API for `cr` and be able to push/pull to/from the repositories
inside the namespace created.


## Architecture Diagram
After using this module, the following resources will be created:

![terraform-alicloud-cr diagram](https://raw.githubusercontent.com/roura356a/terraform-alicloud-cr/master/diagram.png "Module Diagram")


## Inputs
| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| region | The region used to launch this module resources | string | - | no |
| profile | The profile name as set in the shared credentials file. If not set, it will be sourced from the ALICLOUD_PROFILE environment variable | string | - | no |
| shared_credentials_file | This is the path to the shared credentials file. If this is not set and a profile is specified, $HOME/.aliyun/config.json will be used | string | - | no |
| skip_region_validation | Skip static validation of region ID. Used by users of alternative AlibabaCloud-like APIs or users w/ access to regions that are not public (yet) | bool | - | no |
| namespace | Name of Container Registry namespace | string | - | yes |
| repositories | List of optional repositories to be created on apply | list(string) | - | no |
| repo_autocreate | Boolean, when it set to true, repositories are automatically created when pushing new images. If it set to false, you create repository for images before pushing | bool | - | no |


You can create repositories by populating the `repositories` variable with a list of strings.


## Outputs
| Name | Description |
|------|-------------|
| cr_namespace | The CR Namespace's ID |
| cr_access_key | The CR Namespace's Access Key |
| cr_user | The CR Namespace's User |
| cr_endpoint | Public endpoint of the registry |
| ram_user | The RAM User |
| ram_policy_name | The RAM policy name |
| repository_ids | List of repository IDs created |
| ram_console_username | Console login username |
| disposable_password | Password to activate the console login profile, forces to reset it |
| access_key_status | Status of the created AccessKey |
| ram_policy_type | The RAM policy type |
| ram_policy_attachment | The RAM policy attachment ID |


## Docker Login
In order to activate the newly created RAM user on the Registry, only for the first time and due to a security measure
by Alibaba Cloud (this may change in the future), you need to navigate to the
[Container Registry Console](https://cr.console.aliyun.com/) using the newly created RAM user (with the one-time
password outputted on `terraform apply` as `disposable_password`) and follow the on-screen instructions to activate the
account.

After that, with the `cr-{namespace}-ak.json` file credentials, you can get, by using the `aliyun-cli` SDK, a temporary
secure login credentials by running `aliyun cr GetAuthorizationToken`. 


## Terraform version
Terraform version 0.12.0+ is required for this module to work.


## Authors
Created and maintained by Alberto Roura ([@roura356a](https://github.com/roura356a),
[albertoroura.com](https://albertoroura.com/)). Feel free to contribute.


## Examples
- [Basic](https://github.com/roura356a/terraform-alicloud-cr/tree/master/examples/basic)


## Testing
This Terrafom module uses [terratest](https://github.com/gruntwork-io/terratest) to test the IaC resources created. To
test, go into the `test` folder, run `go mod init cr`, `go mod tidy` and then `go test`.


## License
Apache 2 Licensed. See [LICENSE](https://github.com/roura356a/terraform-alicloud-cr/tree/master/LICENSE) for full
details.


## Reference
* [Terraform Alicloud Provider Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform Alicloud Provider Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform Alicloud Provider Docs](https://www.terraform.io/docs/providers/alicloud/)
