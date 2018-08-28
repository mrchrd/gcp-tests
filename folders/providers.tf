provider "google" {
  credentials = "${ file( "${ path.root }/account.json" ) }"
  region      = "${ var.region }"
}
