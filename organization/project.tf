resource "google_project" "admin" {
  name                = "${ var.project_name }"
  auto_create_network = false
  billing_account     = "${ var.billing_account }"
  org_id              = "${ data.google_organization.main.id }"
  project_id          = "${ var.project_id }"
}

resource "google_project_services" "admin" {
  project  = "${ google_project.admin.id }"
  services = "${ var.admin_services }"
}
