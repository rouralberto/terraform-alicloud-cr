# Container Registry Namespace with RAM User
This example only creates a new PRIVATE Namespace and a RAM User with full permissions on it.


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
