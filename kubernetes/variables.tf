variable "project" {}

variable "cidr_cluster" {
  default = "10.1.0.0/24"
}
variable "cidr_masters" {
  default = "10.2.0.0/28"
}

variable "cidr_nodes" {
  default = "10.3.0.0/24"
}

variable "cidr_pods" {
  default = "10.4.0.0/19"
}

variable "cidr_services" {
  default = "10.5.0.0/24"
}

variable "disk_size_gb" {
  default = 100
}

variable "disk_type" {
  default = "pd-standard"
}

variable "instance_type" {
  default = "n1-standard-1"
}

variable "kubernetes_config_file" {
  default = "kubeconfig"
}

variable "kubernetes_version" {
  default = ""
}

variable "labels" {
  type = "map"

  default = {}
}

variable "maintenance_start_time" {
  default = "07:00"
}

variable "name" {
  default = "mycluster"
}

variable "node_count_initial" {
  default = 1
}

variable "node_count_max" {
  default = 1
}

variable "node_count_min" {
  default = 1
}

variable "region" {
  default = "northamerica-northeast1"
}
