provider "google" {
    project = local.project
    region = local.region
}

locals {
  project = "emerald-spring-465406-s1"
  region = "us-central1"
  machine_type = "e2-medium"
  zone = "us-central1-f"
  name = "vm1"
  image = "debian-12"
  network = "default"
}

resource "google_compute_instance" "tf_vm1" {
    name = local.name
    machine_type = local.machine_type
    zone = local.zone
    boot_disk {
      initialize_params {
        image = local.image
      }
    }
    network_interface {
      network = local.network
      access_config {
        
      }
    }
}

