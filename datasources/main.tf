# provider "google" {
#     project = "emerald-spring-465406-s1"
#     region = "us-central1"  
# }

# variable "region" {
#     type = string
#     default = "us-central1"
  
# }

# data "google_compute_zones" "available_zones" {
#     region = var.region
  
# }


# resource "google_compute_instance" "vm3" {
#     count = 2
#     name = "sai-${count.index}"
#     zone = data.google_compute_zones.available_zones.names[count.index]
#     machine_type = "e2-medium"
#     boot_disk {
#       initialize_params {
#         image = "debian-12"
#       }
#     }
#     network_interface {
#       network = "default"
#       access_config {
        
#       }
#     }
  
# }