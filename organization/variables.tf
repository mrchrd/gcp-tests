variable billing_account {}
variable domain {}
variable project_id {}
variable project_name {}
variable service_account_id {}
variable service_account_name {}

variable admin_roles {
  type = "list"

  default = [
    "roles/billing.admin",
    "roles/billing.projectManager",
    "roles/owner",
    "roles/resourcemanager.folderCreator",
    "roles/resourcemanager.organizationAdmin",
    "roles/resourcemanager.projectCreator",
  ]
}

variable admin_services {
  type = "list"

  default = [
    "cloudbilling.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "iam.googleapis.com",
    "serviceusage.googleapis.com",

#    "bigquery-json.googleapis.com",
#    "cloudapis.googleapis.com",
#    "clouddebugger.googleapis.com",
#    "cloudtrace.googleapis.com",
#    "datastore.googleapis.com",
#    "logging.googleapis.com",
#    "monitoring.googleapis.com",
#    "servicemanagement.googleapis.com",
#    "sql-component.googleapis.com",
#    "storage-api.googleapis.com",
#    "storage-component.googleapis.com",
  ]
}

variable region {
  default = "northamerica-northeast1"
}
