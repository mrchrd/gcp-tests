module "dev" {
  source = "folder.module"

  admin_project_id     = "${ var.admin_project_id }"
  name                 = "dev"
  parent               = "${ var.organization_name }"
  service_account_id   = "dev-admin"
  service_account_name = "Development Folder Administrator"
}

module "prod" {
  source = "folder.module"

  admin_project_id     = "${ var.admin_project_id }"
  name                 = "prod"
  parent               = "${ var.organization_name }"
  service_account_id   = "prod-admin"
  service_account_name = "Production Folder Administrator"
}
