module "kubernetes" {
  source = "project.module"

  name                 = "kubernetes"
  billing_account      = "${ var.billing_account }"
  id                   = "kubernetes-2831"
  folder_id            = "${ var.folder_id }"
  service_account_id   = "kubernetes-admin"
  service_account_name = "Kubernetes Administrator"

  labels = {
    owner = "michael"
  }

  services = [
    "bigquery-json.googleapis.com",
    "compute.googleapis.com",
    "container.googleapis.com",
    "containerregistry.googleapis.com",
    "oslogin.googleapis.com",
    "pubsub.googleapis.com",
    "serviceusage.googleapis.com",
    "storage-api.googleapis.com",

#   "bigquery-json.googleapis.com",
#   "cloudapis.googleapis.com",
#   "clouddebugger.googleapis.com",
#   "cloudtrace.googleapis.com",
#   "datastore.googleapis.com",
#   "logging.googleapis.com",
#   "monitoring.googleapis.com",
#   "servicemanagement.googleapis.com",
#   "sql-component.googleapis.com",
#   "storage-api.googleapis.com",
#   "storage-component.googleapis.com",
  ]
}
