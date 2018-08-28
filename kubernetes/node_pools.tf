resource "google_container_node_pool" "default" {
  cluster            = "${ google_container_cluster.main.name }"
  initial_node_count = "${ var.node_count_initial }"
  project            = "${ var.project }"
  region             = "${ var.region }"

  autoscaling {
    max_node_count = "${ var.node_count_max }"
    min_node_count = "${ var.node_count_min }"
  }

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  node_config {
    disk_size_gb = "${ var.disk_size_gb }"
    disk_type    = "${ var.disk_type }"
    image_type   = "COS"
    machine_type = "${ var.instance_type }"
    preemptible  = true

    labels       = "${ merge(
      "${ var.labels }",
      map( "dedicated", "default" )
    ) }"


    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",

#      "https://www.googleapis.com/auth/devstorage.read_only",
#      "https://www.googleapis.com/auth/servicecontrol",
#      "https://www.googleapis.com/auth/service.management.readonly",
#      "https://www.googleapis.com/auth/trace.append"
    ]
  }
}
