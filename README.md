# Alicloud Container Registry Terraform Module
A terraform module to create a private Container Registry Namespace and a RAM user able to pull/push from the Registry.

**NOTE:** This module uses _AccessKey_ and _SecretKey_ from `profile` and `shared_credentials_file`. If you have not set them yet, please install [aliyun-cli](https://github.com/aliyun/aliyun-cli#installation) and configure it.

----------------------

## Usage
```
provider "alicloud" {}

module "cr" {
  source  = "roura356a/cr/alicloud"
  version = "1.0.5"
  
  namespace = "your_namespace"
}
```

After running `terraform apply`, a file called `ecr-ak.json` will be generated with the AccessKey & SecretKey needed to
push/pull to/from the repositories inside the namespace created.

## Inputs
| Name | Description | Type | Default | Required | Valid When |
|------|-------------|------|---------|----------|------------|
|  namespace |     Name of Container Registry namespace     | string  |   -   |    yes   |     -    |


## Outputs
| Name | Description |
|------|-------------|
|  ecr_user_id |     The ECR Namespace's User ID     |
|  ecr_user_name |     The ECR Namespace's User Name     |
|  ecr_user_key |     The ECR Namespace's User access key ID     |


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
