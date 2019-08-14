variable "project" {
  default = "<your_project_name>"
}

variable "region" {
  default = "europe-north1"
}

variable "cluster_location" {
  default = "europe-north1-a"
}

variable "cluster_k8s_version" {
  default = "1.13.7-gke.8"
}

variable "initial_node_count" {
  default = 3
}

variable "autoscaling_min_node_count" {
  default = 1
}

variable "autoscaling_max_node_count" {
  default = 8
}

variable "disk_size_gb" {
  default = 20
}

variable "disk_type" {
  default = "pd-standard"
}

variable "machine_type" {
  default = "n1-standard-1"
}
