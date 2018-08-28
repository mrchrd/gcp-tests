resource "google_service_account" "admin" {
  account_id   = "${ var.service_account_id }"
  display_name = "${ var.service_account_name }"
  project      = "${ google_project.admin.id }"
}

resource "google_organization_iam_member" "admin" {
  member = "serviceAccount:${ google_service_account.admin.email }"
  count  = "${ length( "${ var.admin_roles }" ) }"
  org_id = "${ data.google_organization.main.id }"
  role   = "${ var.admin_roles[ count.index ] }"
}

resource "google_service_account_key" "admin" {
  service_account_id = "${ google_service_account.admin.name }"
}

resource "local_file" "account_json" {
  filename = "${ path.root }/output/account.json"
  content  = "${ base64decode( "${ google_service_account_key.admin.private_key }" ) }"

  provisioner "local-exec" {
    command = "chmod 640 '${ local_file.account_json.filename }'"
  }
}
