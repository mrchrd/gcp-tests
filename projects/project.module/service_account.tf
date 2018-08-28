resource "google_service_account" "main" {
  account_id   = "${ var.service_account_id }"
  display_name = "${ var.service_account_name }"
  project      = "${ google_project.main.id }"
}

resource "google_project_iam_member" "main" {
  member  = "serviceAccount:${ google_service_account.main.email }"
  count   = "${ length( "${ var.service_account_roles }" ) }"
  project = "${ google_project.main.id }"
  role    = "${ var.service_account_roles[ count.index ] }"
}

resource "google_service_account_key" "main" {
  service_account_id = "${ google_service_account.main.name }"
}
