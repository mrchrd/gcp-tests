resource "google_compute_network" "main" {
  name                    = "${ var.name }"
  auto_create_subnetworks = false
  project                 = "${ var.project }"
  routing_mode            = "REGIONAL"
}

resource "google_compute_subnetwork" "main" {
  name             = "${ var.name }"
  enable_flow_logs = true
  ip_cidr_range    = "${ var.cidr_nodes }"
  network          = "${ google_compute_network.main.self_link }"
  project          = "${ var.project }"
  region           = "${ var.region }"

#  secondary_ip_range {
#    range_name    = "cluster"
#    ip_cidr_range = "${ local.cidr_cluster }"
#  }
#
#  secondary_ip_range {
#    range_name    = "services"
#    ip_cidr_range = "${ local.cidr_services }"
#  }
}
