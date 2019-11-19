# Módulo Terraform para Alicloud Container Registry
Módulo Terraform para crear un Registro de Contenedores Docker privado (namespace) y un usuario RAM con permisos para hacer push/pull al namespace creado.

**NOTA:** Este módulo usa _AccessKey_ y _SecretKey_ del `profile` y del `shared_credentials_file`. Si no los has definido todavía, por favor instala [aliyun-cli](https://github.com/aliyun/aliyun-cli#installation) y configúralo.

***Disponible en otros idiomas:*** [English](https://github.com/roura356a/terraform-alicloud-cr/blob/master/README.md), [Español](https://github.com/roura356a/terraform-alicloud-cr/blob/master/README.es-ES.md), [简体中文](https://github.com/roura356a/terraform-alicloud-cr/blob/master/README.zh-CN.md).

----------------------

## Uso
```hcl
provider "alicloud" {}

module "cr" {
  source  = "roura356a/cr/alicloud"
  version = "1.0.8"
  
  namespace = "tu_namespace"
}
```

Tras ejecutar `terraform apply`, un fichero llamado `cr-ak.json` será generado con el AccessKey y SecretKey necesarios para hacer push/pull a los repositorios dentro del namespace creado.

## Entradas
| Nombre | Descripción | Tipo | Valor por defecto | Requerido |
|------|-------------|------|---------|----------|
| region | La región usada para lanzar los recursos definidos por el módulo | string | - | no |
| profile | El nombre del perfil como aparece en el archivo `credentials`. Si no se proporciona, el valor será leído de la variable de entorno ALICLOUD_PROFILE | string | - | no |
| shared_credentials_file | La ruta al archivo `credentials`. Si no se proporciona y un perfil ha sido especificado, se asumirá $HOME/.aliyun/config.json como valor | string | - | no |
| skip_region_validation | Omitir validación estática de la región. Usada por usuarios que tienen acceso a regiones privadas o regiones que usan APIs compatibles con Alibaba Cloud | bool | - | no |
| namespace | Nombre del namespace para crear en el Registro de Contenedores | string | - | sí |
| repositories | Lista opcional de repositorios para ser creados al lanzar | list(string) | - | no |
| repo_autocreate | Booleana, cuando se asigne true, los repositorios podrán ser creados al vuelo cuando se use docker push con nuevas imágenes | bool | - | no |

Puedes crear repositorios simplemente con proporcionar una lista de strings con la variable `repositories`.

## Salidas
| Name | Description |
|------|-------------|
|  cr_user_id | El ID del usuario para el namespace de CR |
|  cr_user_name | El nombre del usuario para el namespace de CR |
|  cr_user_key | El AccessKey para el namespace de CR |


## Versión de Terraform
Terraform version 0.12.0+ es requerida para que funcione este módulo.


## Autores
Creado y maintenido por Alberto Roura ([@roura356a](https://github.com/roura356a), [albertoroura.com](https://albertoroura.com/)). Contribuye si quieres.

## Ejemplos
- [Básico](https://github.com/roura356a/terraform-alicloud-cr/tree/master/examples/basic)
- [Con Repositorios](https://github.com/roura356a/terraform-alicloud-cr/tree/master/examples/with-repositories)

## Licencia
Licencia Apache 2. Abre [LICENSE](LICENSE) para más detalles.


## Referencias
* [Terraform Alicloud Provider Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform Alicloud Provider Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform Alicloud Provider Docs](https://www.terraform.io/docs/providers/alicloud/)
