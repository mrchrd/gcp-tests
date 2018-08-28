resource "google_container_cluster" "main" {
  name                    = "${ var.name }"
  cluster_ipv4_cidr       = "${ var.cidr_pods }"
  logging_service         = "logging.googleapis.com"
  master_ipv4_cidr_block  = "${ var.cidr_masters }"
  min_master_version      = "${ var.kubernetes_version }"
  monitoring_service      = "monitoring.googleapis.com"
  network                 = "${ replace("${ google_compute_network.main.self_link }", "https://www.googleapis.com/compute/v1/", "") }"
  private_cluster         = false
  project                 = "${ var.project }"
  region                  = "${ var.region }"
  resource_labels         = "${ var.labels }"
  remove_default_node_pool = true
  subnetwork              = "${ replace("${ google_compute_subnetwork.main.self_link }", "https://www.googleapis.com/compute/v1/", "") }"

  addons_config {
    horizontal_pod_autoscaling {
      disabled = false
    }

    http_load_balancing {
      disabled = false
    }

    kubernetes_dashboard {
      disabled = true
    }

    network_policy_config {
      disabled = false
    }

  }

#  ip_allocation_policy {
#    cluster_secondary_range_name  = "cluster"
#    services_secondary_range_name = "services"
#  }

  lifecycle {
    ignore_changes = [ "node_pool" ]
  }

  maintenance_policy {
    daily_maintenance_window {
      start_time = "${ var.maintenance_start_time }"
    }
  }

  master_auth {
    password = ""
    username = ""

    client_certificate_config {
      issue_client_certificate = false
    }
  }

  master_authorized_networks_config {
    cidr_blocks {
      cidr_block = "0.0.0.0/0"
    }
  }

  network_policy {
    enabled = true
    provider = "PROVIDER_UNSPECIFIED"
  }

  node_pool {
    name = "default-pool"
  }
}
