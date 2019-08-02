locals {
  cluster_type = "simple-regional"
}

provider "google" {
  version = "~> 2.9.0"
  region  = var.region
}

provider "google-beta" {
  version = "~> 2.9.0"
  region  = var.region
}

module "gke" {
  source            = "../../"
  project_id        = var.project_id
  name              = "${local.cluster_type}-cluster${var.cluster_name_suffix}"
  regional          = true
  region            = var.region
  network           = var.network
  subnetwork        = var.subnetwork
  ip_range_pods     = var.ip_range_pods
  ip_range_services = var.ip_range_services
  service_account   = var.compute_engine_service_account
}

data "google_client_config" "default" {
}
