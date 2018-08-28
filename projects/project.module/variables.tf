variable "billing_account" {}
variable "id" {}
variable "name" {}
variable "folder_id" {}
variable "service_account_id" {}
variable "service_account_name" {}

variable "labels" {
  type = "map"

  default = {}
}

variable "service_account_roles" {
  type = "list"

  default = [
    "roles/owner",
  ]
}

variable "services" {
  type = "list"

  default = []
}
