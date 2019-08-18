provider "google" {
  project = "${var.project}"
  region  = "${var.region}"
}

resource "google_container_cluster" "app-cluster" {
  name               = "${var.project}-${var.cluster_location}"
  location           = "${var.cluster_location}"
  min_master_version = "${var.cluster_k8s_version}"

  // Use legacy ABAC until these issues are resolved:
  //   https://github.com/mcuadros/terraform-provider-helm/issues/56
  //   https://github.com/terraform-providers/terraform-provider-kubernetes/pull/73
  enable_legacy_abac = true

  node_pool {
    name               = "default-pool"
    initial_node_count = "${var.initial_node_count}"

    autoscaling {
      min_node_count = "${var.autoscaling_min_node_count}"
      max_node_count = "${var.autoscaling_max_node_count}"
    }

    node_config {
      preemptible  = false
      disk_size_gb = "${var.disk_size_gb}"
      disk_type    = "${var.disk_type}"
      machine_type = "${var.machine_type}"
    }
  }
}

provider "helm" {
  tiller_image = "gcr.io/kubernetes-helm/tiller:${var.helm_version}"

  kubernetes {
    host                   = "${google_container_cluster.app-cluster.endpoint}"
    client_certificate     = "${base64decode(google_container_cluster.app-cluster.master_auth.0.client_certificate)}"
    client_key             = "${base64decode(google_container_cluster.app-cluster.master_auth.0.client_key)}"
    cluster_ca_certificate = "${base64decode(google_container_cluster.app-cluster.master_auth.0.cluster_ca_certificate)}"
  }
}

resource "helm_release" "proxy-load-balancer_traefik" {
  chart = "stable/traefik"
  name  = "traefik"
}
