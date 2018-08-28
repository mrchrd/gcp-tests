resource "google_project" "main" {
  name                = "${ var.name }"
  auto_create_network = false
  billing_account     = "${ var.billing_account }"
  folder_id           = "${ var.folder_id }"
  labels              = "${ var.labels }"
  project_id          = "${ var.id }"
}

resource "google_project_services" "main" {
  project  = "${ google_project.main.id }"
  services = "${ var.services }"
}
