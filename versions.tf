terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "~> 4.59.0"
    }
  }

  required_version = "~> 1.4.4"
}

provider "google" {
  project     = "tst-project-112334"
  region      = "us-central1"
}