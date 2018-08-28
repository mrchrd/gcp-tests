resource "google_folder" "main" {
  display_name = "${ var.name }"
  parent       = "${ var.parent }"
}
