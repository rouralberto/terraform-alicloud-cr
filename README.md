# Alicloud Container Registry Terraform Module
A terraform module to create a private Container Registry namespace and a RAM user able to pull/push from the namespace created.

**NOTE:** This module uses _AccessKey_ and _SecretKey_ from `profile` and `shared_credentials_file`. If you have not set them yet, please install [aliyun-cli](https://github.com/aliyun/aliyun-cli#installation) and configure it.

***Read this in other languages:*** [English](README.md), [Español](README.es-ES.md), [简体中文](README.zh-CN.md).

----------------------

## Usage
```hcl
provider "alicloud" {}

module "cr" {
  source  = "roura356a/cr/alicloud"
  version = "1.0.7"
  
  namespace = "your_namespace"
}
```

After running `terraform apply`, a file called `cr-ak.json` will be generated with the AccessKey & SecretKey needed to
push/pull to/from the repositories inside the namespace created.

## Inputs
| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| region | The region used to launch this module resources | string | - | no |
| profile | The profile name as set in the shared credentials file. If not set, it will be sourced from the ALICLOUD_PROFILE environment variable | string | - | no |
| shared_credentials_file | This is the path to the shared credentials file. If this is not set and a profile is specified, $HOME/.aliyun/config.json will be used | string | - | no |
| skip_region_validation | Skip static validation of region ID. Used by users of alternative AlibabaCloud-like APIs or users w/ access to regions that are not public (yet) | bool | - | no |
| namespace | Name of Container Registry namespace | string | - | yes |
| repo_autocreate | Boolean, when it set to true, repositories are automatically created when pushing new images. If it set to false, you create repository for images before pushing | bool | - | no |


## Outputs
| Name | Description |
|------|-------------|
| cr_user_id | The CR Namespace's User ID |
| cr_user_name | The CR Namespace's User Name |
| cr_user_key | The CR Namespace's User access key ID |


## Terraform version
Terraform version 0.12.0+ is required for this module to work.


## Authors
Created and maintained by Alberto Roura ([@roura356a](https://github.com/roura356a), [albertoroura.com](https://albertoroura.com/)). Feel free to contribute.


## License
Apache 2 Licensed. See [LICENSE](LICENSE) for full details.


## Reference
* [Terraform Alicloud Provider Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform Alicloud Provider Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform Alicloud Provider Docs](https://www.terraform.io/docs/providers/alicloud/)

### TODO
- Create optional set of repositories if specified.
