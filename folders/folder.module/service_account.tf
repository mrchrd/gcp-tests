resource "google_service_account" "main" {
  account_id   = "${ var.service_account_id }"
  display_name = "${ var.service_account_name }"
  project      = "${ var.admin_project_id }"
}

resource "google_folder_iam_member" "main" {
  member = "serviceAccount:${ google_service_account.main.email }"
  count  = "${ length( "${ var.service_account_roles }" ) }"
  folder = "${ google_folder.main.name }"
  role   = "${ var.service_account_roles[ count.index ] }"
}

resource "google_service_account_key" "main" {
  service_account_id = "${ google_service_account.main.name }"
}
