locals {
  network = {
    prd = terraform.workspace == "prd" ? module.vpc[local.name].subnetwork_self_link[local.name] : null
    dev = terraform.workspace == "dev" ? data.google_compute_subnetwork.main[terraform.workspace].self_link : null
  }

  network_enable = {
    prd = true
    dev = false
  }

  network_conf = local.network_enable[terraform.workspace] ? [
    {
      name = local.name
      subnetworks = [
        {
          name   = local.name
          cidr   = "192.168.10.0/24"
          region = "asia-northeast1"
        }
      ]
      firewall = []
    }
  ] : []

  name                = "sample"
  default_subnet_name = "research"
}

variable "project" {
  type = string
}

data "google_compute_subnetwork" "main" {
  for_each = terraform.workspace == "dev" ? toset([terraform.workspace]) : []
  name     = local.default_subnet_name
  region   = "asia-northeast1"
  project  = var.project
}


module "vpc" {
  for_each = { for v in local.network_conf : v.name => v }
  source   = "github.com/AtsushiKitano/assets/terraform/gcp/modules/network/vpc_network"

  vpc_network = {
    name = each.value.name
  }
  subnetworks = each.value.subnetworks
  firewall    = each.value.firewall

  project = var.project
}

module "gce" {
  source = "github.com/AtsushiKitano/assets/terraform/gcp/modules/compute/gce"

  gce_instance = {
    name         = local.name
    machine_type = "f1-micro"
    zone         = "asia-northeast1-b"
    subnetwork   = local.network[terraform.workspace]
    tags         = []
  }

  boot_disk = {
    name      = local.name
    size      = 20
    interface = null
    image     = "ubuntu-os-cloud/ubuntu-2004-lts"
  }

  project = var.project
}
