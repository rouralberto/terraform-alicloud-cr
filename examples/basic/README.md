# Container Registry Namespace with RAM User
This example only creates a new PRIVATE Namespace and a RAM User with full permissions on it.

***Read this in other languages:*** [English](https://github.com/roura356a/terraform-alicloud-cr/blob/master/examples/basic/README.md), [Español](https://github.com/roura356a/terraform-alicloud-cr/blob/master/examples/basic/README.es-ES.md), [简体中文](https://github.com/roura356a/terraform-alicloud-cr/blob/master/examples/basic/README.zh-CN.md).

----------------------


## Usage
To run this example you need to run:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```


## Outputs
| Name | Description |
|------|-------------|
| cr_access_key | The CR Namespace's Access Key |
| cr_endpoint | Public endpoint of the registry |
