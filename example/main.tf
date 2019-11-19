provider "alicloud" {}

variable "namespace" {
  default = "my_ecr_namespace"
}

module "cr" {
  source    = "roura356a/cr/alicloud"
  version   = "1.0.6" 
  namespace = var.namespace
}
