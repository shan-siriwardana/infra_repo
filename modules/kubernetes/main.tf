resource "google_container_cluster" "primary" {

  name                     = var.cluster_name
  location                 = var.cluster_master_location
  network                  = var.cluster_network
  remove_default_node_pool = true
  initial_node_count       = 1

  cluster_autoscaling {
    enabled = yes
    resource_limits {
      resource_type = "cpu"
      minimum       = var.cluster_autoscale_min_cpu
      maximum       = var.cluster_autoscale_max_cpu
    }
  }

  #   dynamic "master_authorized_networks_config" {
  #     for_each = local.master_authorized_networks_config
  #     content {
  #       dynamic "cidr_blocks" {
  #         for_each = master_authorized_networks_config.value.cidr_blocks
  #         content {
  #           cidr_block   = lookup(cidr_blocks.value, "cidr_block", "")
  #           display_name = lookup(cidr_blocks.value, "display_name", "")
  #         }
  #       }
  #     }
  #   }


  addons_config {
    http_load_balancing {
      disabled = false
    }
    # horizontal_pod_autoscaling {
    #   disabled = !var.horizontal_pod_autoscaling
    # }
  }
}


# node pool
resource "google_container_node_pool" "nodepool" {

  cluster        = google_container_cluster.primary.name
  node_locations = var.node_locations


  initial_node_count = var.initial_node_count


  autoscaling {
    min_node_count = var.autoscale_min_node_count
    max_node_count = var.autoscale_max_node_count
    #   location_policy      = lookup(autoscaling.value, "location_policy", null)
  }



  node_config {
    machine_type    = var.node_machine_type
    service_account = var.nodepool_service_account #### fill up
  }


}

/**
 * Copyright 2022 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// This file was automatically generated from a template in ./autogen/main

locals {
  service_account_list = compact(
    concat(
      google_service_account.cluster_service_account.*.email,
      ["dummy"],
    ),
  )
  // if user set var.service_account it will be used even if var.create_service_account==true, so service account will be created but not used
  service_account = (var.service_account == "" || var.service_account == "create") && var.create_service_account ? local.service_account_list[0] : var.service_account

  registry_projects_list = length(var.registry_project_ids) == 0 ? [var.project_id] : var.registry_project_ids
}


resource "google_service_account" "cluster_service_account" {
  account_id   = "tf-gke-sa"
  display_name = "Terraform-managed service account for ${var.cluster_name} GKE cluster"
}

resource "google_project_iam_member" "cluster_service_account-log_writer" {
  project = var.project_id
  role    = "roles/logging.logWriter"
  member  = "serviceAccount:${google_service_account.cluster_service_account.email}"
}

resource "google_project_iam_member" "cluster_service_account-metric_writer" {
  project = var.project_id
  role    = "roles/monitoring.metricWriter"
  member  = "serviceAccount:${google_service_account.cluster_service_account.email}"
}

resource "google_project_iam_member" "cluster_service_account-monitoring_viewer" {
  project = var.project_id
  role    = "roles/monitoring.viewer"
  member  = "serviceAccount:${google_service_account.cluster_service_account.email}"
}

resource "google_project_iam_member" "cluster_service_account-resourceMetadata-writer" {
  project = var.project_id
  role    = "roles/stackdriver.resourceMetadata.writer"
  member  = "serviceAccount:${google_service_account.cluster_service_account.email}"
}

resource "google_project_iam_member" "cluster_service_account-gcr" {
  project = var.project_id
  role    = "roles/storage.objectViewer"
  member  = "serviceAccount:${google_service_account.cluster_service_account.email}"
}

resource "google_project_iam_member" "cluster_service_account-artifact-registry" {
  project = var.project_id
  role    = "roles/artifactregistry.reader"
  member  = "serviceAccount:${google_service_account.cluster_service_account.email}"
}

resource "google_project_iam_member" "cluster_service_account-artifact-registry" {
  project = var.project_id
  role    = "roles/artifactregistry.writer"
  member  = "serviceAccount:${google_service_account.cluster_service_account.email}"
}