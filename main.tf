provider "google" {
  credentials = "${file("gcp-terraform-account-for-computer-engine.json")}"
  project = var.project
  region  = var.region
  zone    = var.zone
}
# resource "google_compute_network" "default" {
#   name = "my-network"
# }

# resource "google_compute_subnetwork" "default" {
#   name          = "my-subnet"
#   ip_cidr_range = "10.128.0.0/16"
#   region        = "us-central1"
#   network       = google_compute_network.default.id
# }

# resource "google_compute_address" "instance_with_ip" {
#   name         = "my-internal-address"
#   subnetwork   = google_compute_subnetwork.default.id
#   address_type = "INTERNAL"
#   address      = "10.128.0.4"
#   region       = "us-central1"
# }

resource "google_compute_instance" "default" {
  for_each = var.servers
  # for_each = { for s in var.servers : format("%s%01d", s.name) => s }
  name = each.value.name
  zone = each.value.zone
  # count = each.value.count
  # name         = var.name
  machine_type = var.machine_type
  tags = var.resource_tags
  labels = var.labels

  boot_disk {
    initialize_params {
      image = var.image
      type  = var.boot_disk_type
      size  = var.boot_disk_size
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    # for_each = var.servers
    network = "default"
    network_ip = each.value.ip
    # network = google_compute_network.vpc_network.self_link
    # access_config {
    #   nat_ip = google_compute_address.instance_with_ip.address
    # }
  }
}

# resource "google_compute_network" "vpc_network" {
#   name                    = "terraform-network"
#   auto_create_subnetworks = "true"
# }