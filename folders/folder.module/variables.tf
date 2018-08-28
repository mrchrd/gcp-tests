variable "admin_project_id" {}
variable "name" {}
variable "parent" {}
variable "service_account_id" {}
variable "service_account_name" {}

variable "service_account_roles" {
  type = "list"

  default = [
    "roles/billing.projectManager",
    "roles/iam.serviceAccountAdmin",
    "roles/iam.serviceAccountKeyAdmin",
    "roles/owner",
    "roles/resourcemanager.folderCreator",
    "roles/resourcemanager.projectCreator",
    "roles/resourcemanager.projectIamAdmin",
  ]
}
