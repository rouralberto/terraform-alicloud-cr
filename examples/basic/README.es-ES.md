# Registro de Contenedores con usuario RAM
Este ejemplo sólo crea un nuevo Namespace PRIVADO y un usuario RAM con permisos totales.

***Disponible en otros idiomas:*** [English](https://github.com/roura356a/terraform-alicloud-cr/blob/master/examples/basic/README.md), [Español](https://github.com/roura356a/terraform-alicloud-cr/blob/master/examples/basic/README.es-ES.md), [简体中文](https://github.com/roura356a/terraform-alicloud-cr/blob/master/examples/basic/README.zh-CN.md).

----------------------


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
| cr_access_key | El AccessKey para el namespace de CR |
| cr_endpoint | Dominio público del Registro de Contenedores |
