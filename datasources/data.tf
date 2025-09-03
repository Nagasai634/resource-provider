provider "google" {
    project = "emerald-spring-465406-s1"
    region = "us-central1"  
}

variable "image" {
    type = string
    default = ""
  
}

data "google_compute_image" "available_images" {
     family = var.image
     
  
}


resource "google_compute_instance" "vm3" {
    count = 2
    name = "sai-${count.index}"
    zone = "us-central1-a"
    machine_type = "e2-medium"
    boot_disk {
      initialize_params {
        image = data.google_compute_image.available_images.name[count.index]
      }
    }
    network_interface {
      network = "default"
      access_config {
        
      }
    }
  
}