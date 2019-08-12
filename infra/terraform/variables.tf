variable "project" {
  default = "<your_project_name>"
}

variable "region" {
  default = "eu-west1-a"
}

variable "cluster_location" {
  default = "europe-west2-a"
}

variable "cluster_k8s_version" {
  default = "1.13.7-gke.15"
}

variable "initial_node_count" {
  default = 3
}

variable "autoscaling_min_node_count" {
  default = 1
}

variable "autoscaling_max_node_count" {
  default = 4
}

variable "disk_size_gb" {
  default = 20
}

variable "disk_type" {
  default = "pd-standard"
}

variable "machine_type" {
  default = "f1-micro"
}
