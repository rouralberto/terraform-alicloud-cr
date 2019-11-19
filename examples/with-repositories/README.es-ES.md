# Registro de Contenedores con usuario RAM y una set de Repositorios
Este ejemplo crea un nuevo Namespace PRIVADO, un set de repositorios y un usuario RAM con permisos totales.


## Uso
Para lanzar este ejemplo tienes que correr:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```


## Salidas
| Nombre | Descripción |
|------|-------------|
| cr_user_id | El ID del usuario para el namespace de CR |
| cr_user_name | El nombre del usuario para el namespace de CR |
| cr_user_key | El AccessKey para el namespace de CR |
| repository_ids | Lista de posibles repositorios creados |
| repository_host | Dominio público del Registro de Contenedores |
