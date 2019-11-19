provider "alicloud" {}

variable "namespace" {
  default = "my_cr_namespace"
}

module "cr" {
  source    = "roura356a/cr/alicloud"
  version   = "1.0.7" 
  namespace = var.namespace
}
