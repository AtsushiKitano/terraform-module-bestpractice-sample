resource "google_compute_network" "main" {
  name                    = var.vpc.name
  auto_create_subnetworks = false

  project                         = var.project
  delete_default_routes_on_create = false
}

resource "google_compute_subnetwork" "main" {
  for_each = { for v in var.subnets : v.name => v }
  provider = google-beta

  name          = each.value.name
  ip_cidr_range = each.value.cidr
  network       = google_compute_network.main.self_link
  region        = each.value.location

  project = var.project
}
