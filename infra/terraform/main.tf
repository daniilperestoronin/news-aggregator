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

data "template_file" "proxy_files" {
  template = "${file("../kubernetes/proxy/<.yaml>")}"
}

resource "null_resource" "proxy_deployment" {
  triggers = {
    manifest_sha1 = "${sha1("${data.template_file.proxy_files.rendered}")}"
  }

  provisioner "local-exec" {
    command = "kubectl create -f -<<EOF\n${data.template_file.proxy_files.rendered}\nEOF"
  }
}

data "template_file" "service_files" {
  template = "${file("../kubernetes/service/templates/<.yaml>")}"
}

resource "null_resource" "service_deployment" {
  triggers = {
    manifest_sha1 = "${sha1("${data.template_file.service_files.rendered}")}"
  }

  provisioner "local-exec" {
    command = "kubectl create -f -<<EOF\n${data.template_file.service_files.rendered}\nEOF"
  }
}

data "template_file" "monitoring_files" {
  template = "${file("../kubernetes/monitoring/<.yaml>")}"
}

resource "null_resource" "monitoring_deployment" {
  triggers = {
    manifest_sha1 = "${sha1("${data.template_file.monitoring_files.rendered}")}"
  }

  provisioner "local-exec" {
    command = "kubectl create -f -<<EOF\n${data.template_file.monitoring_files.rendered}\nEOF"
  }
}

data "template_file" "logging_files" {
  template = "${file("../kubernetes/logging/<.yaml>")}"
}

resource "null_resource" "monitoring_deployment" {
  triggers = {
    manifest_sha1 = "${sha1("${data.template_file.logging_files.rendered}")}"
  }

  provisioner "local-exec" {
    command = "kubectl create -f -<<EOF\n${data.template_file.logging_files.rendered}\nEOF"
  }
}
