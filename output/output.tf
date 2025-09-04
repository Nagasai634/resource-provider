
provider "google" { 
  region = "us-central"
  project = "emerald-spring-465406-s1"
}


variable "vm_names" {
    type = string
    default = "lokiserver"
  
}

resource "google_compute_network" "tf_net" {
    name = "vpc-1"
    auto_create_subnetworks = false
  
}

resource "google_compute_subnetwork" "tf_subnet1" {
    name = "subnet-1"
    ip_cidr_range = "172.10.0.0/16"
    network = google_compute_network.tf_net.id
    region = "us-central1"
  
}

resource "google_compute_firewall" "tf_firewall" {
    name = "firewall-1"
    network = google_compute_network.tf_net.id
    direction = "INGRESS"
    allow {
      ports = ["22","80"]
      protocol = "tcp"
    }
    source_ranges = ["0.0.0.0/0"]
  
}


resource "google_compute_instance" "tf_vm1" {
    count = 2
    name = "${var.vm_names}-${count.index}"
    zone = "us-central1-f"
    machine_type = "e2-medium"
    network_interface {
        network = "vpc-1"
        subnetwork = "subnet-1"
      access_config {
        
      }
    }
    boot_disk {
        initialize_params {
          image = "debian-12"
        }
      
    }
    depends_on = [ 
        google_compute_network.tf_net, google_compute_subnetwork.tf_subnet1
     ]

  
}


output "vms" {
    value = [for instance in google_compute_instance.tf_vm1 : instance.name]
  
}

output "vms_details" {
    value = {
        for instance in google_compute_instance.tf_vm1 : instance.name => {
            id = instance.id
            machine_type = instance.machine_type
            zone = instance.zone 

        }
    }
  
}














