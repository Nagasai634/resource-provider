provider "google" {
    project = "emerald-spring-465406-s1"
    region = "us-central1"
    credentials = file("saicreds.json")
  
}

provider "google" {
    alias = "project_2"
    project = "loki-project-468104"
    region = "us-central1"
    credentials = file("lokicreds.json")
  
}

resource "google_compute_instance" "vm1" {
    count = 2
    name = "nagasai-${count.index}"
    zone = "us-central1-f"
    machine_type = "e2-medium"
    boot_disk {
      initialize_params {
        image = "debian-12"
      }
    }
    network_interface {
      network = "default"
      access_config {
        
      }
    }
}



resource "google_compute_instance" "vm4" {
    count = 2
    name = "lokesh-${count.index}"
    zone = "us-central1-b"
    machine_type = "e2-medium"
    boot_disk {
      initialize_params {
        image = "debian-12"
      }
    }
    network_interface {
      network = "default"
      access_config {
        
      }
    }
    provider = google.project_2
}