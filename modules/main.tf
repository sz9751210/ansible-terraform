provider "google" {
  credentials = file("../../gcp-terraform-account-for-computer-engine.json")
  project = var.project
  region  = var.region
  zone    = var.zone
}

# Create a resource for each IP address in the list
resource "google_compute_address" "ip" {
  for_each = var.servers
  name = "${each.key}-ip"
  address_type  = "INTERNAL"
  address = each.value.ip
  region = var.region
}

# Create a resource for each instance in the list
resource "google_compute_instance" "server" {
  for_each = var.servers
  name = each.key
  zone = each.value.zone
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
    network = "default"
    network_ip = google_compute_address.ip[each.key].address
  }
}

resource "null_resource" "run_ansible_playbook" {
  provisioner "local-exec" {
    command = var.ansible_command
  }
  depends_on = [
    google_compute_instance.server
  ]
}

