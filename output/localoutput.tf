locals {
  name = "local-vm"
  zone = "us-central1-a"
  machine_type = "e2-medium"
  image = "debian-12"
}

resource "google_compute_instance" "localvm" {
  name         = local.name
  zone         = local.zone
  machine_type = local.machine_type
  boot_disk {
    initialize_params {
      image = local.image
    }
  }
  network_interface {
    network = "default"
    
  } 
}



output "name" {
  value = google_compute_instance.localvm
  sensitive = true
  
}
output "all" {
  value = {
    (google_compute_instance.localvm.name) = {
      id = google_compute_instance.localvm.id
      machine_type = google_compute_instance.localvm.machine_type
      zone = google_compute_instance.localvm.zone 
    }
  }
  
}
