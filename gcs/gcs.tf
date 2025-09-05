
provider "google" { 
  region = "us-central"
  project = "emerald-spring-465406-s1"
}


resource "google_storage_bucket" "static-site" {
  name          = "sai-emerald-spring-465406-s1"
  location      = "US-CENTRAL1"
  storage_class = "STANDARD"
  force_destroy = true

  uniform_bucket_level_access = true
  versioning {
    enabled = true
  }
}


terraform {
  backend "gcs" {
    bucket =  "sai-emerald-spring-465406-s1"
    prefix = "nagasai/"
    
  }
}