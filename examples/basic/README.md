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
| cr_user_id | The CR Namespace's User ID |
| cr_user_name | The CR Namespace's User Name |
| cr_user_key | The CR Namespace's User access key ID |
