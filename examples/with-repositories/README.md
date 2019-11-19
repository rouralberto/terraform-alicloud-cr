# Container Registry Namespace with RAM User and a set of Repositories
This example creates a new PRIVATE Namespace with a set of repositories and a RAM User with full permissions on it.


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
| repository_ids | List of repository IDs created |
| repository_host | Domain of public endpoint |
