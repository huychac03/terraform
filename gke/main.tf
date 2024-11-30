resource "google_container_cluster" "primary" {
  name                     = var.project_name
  location                 = var.regional
  deletion_protection      = false
  remove_default_node_pool = true
  initial_node_count       = var.initial_node_count

  network    = var.gke_network
  subnetwork = var.gke_subnet

  release_channel {
    channel = "REGULAR"
  }
  networking_mode = "VPC_NATIVE"
   ip_allocation_policy {
    cluster_secondary_range_name  = var.list_ip_allocation_policy[0]
    services_secondary_range_name = var.list_ip_allocation_policy[1]
    additional_pod_ranges_config {
      pod_range_names = [ var.list_ip_allocation_policy[2] ]
    }
  }

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = false
    master_ipv4_cidr_block  = "10.80.0.0/28"
    master_global_access_config {
      enabled = true
    }
  }
  # master_authorized_networks_config {
  #   cidr_blocks {
  #     cidr_block   = "118.70.124.20/32"
  #     display_name = "CloudAZ-auth-ip"
  #   }
  # }
}

data "google_container_engine_versions" "gke_version" {
  location       = var.regional
  version_prefix = var.cluster_version
}

# resource "google_container_node_pool" "primary_nodes" {
#   name = var.node-name
#   location = var.regional
#   cluster = google_container_cluster.primary.name

#   initial_node_count = 1
#   #node_count     = var.gke_num_nodes
#   #node_locations = var.zones

#   management {
#     auto_repair  = true
#     auto_upgrade = true
#   }

#   autoscaling {
#     total_min_node_count = 3
#     total_max_node_count = 10
#     location_policy      = "BALANCED"
#   }
#   node_config {
#     oauth_scopes = [
#       "https://www.googleapis.com/auth/cloud-platform",
#       "https://www.googleapis.com/auth/logging.write",
#       "https://www.googleapis.com/auth/monitoring"
#     ]

#     # labels = {
#     #   env = var.project_name
#     # }

#     preemptible  = false
#     machine_type = var.machine_type
#     disk_type    = "pd-ssd" # Type of the disk attached to each node (e.g. 'pd-standard', 'pd-ssd' or 'pd-balanced').
#     disk_size_gb = 100      # Smallest allowed disk size is 10GB. Defaults to 100GB.
#     tags         = [
#       # "<YOUR-PROJECT>-dev-mongodb-tags",
#       # "<YOUR-PROJECT>-dev-redis-tags",
#       # "<YOUR-PROJECT>-dev-kafka-tags",
#       # "<YOUR-PROJECT>-dev-nat-tags",
#       #"<YOUR-PROJECT>-dev-internal-tags",
#       "<YOUR-PROJECT>-dev-source-internal-tags"
#       ]
#     metadata = {
#       disable-legacy-endpoints = "true"
#     }
#   }
# }



resource "google_container_node_pool" "primary_nodes" {
  name = var.node-name
  location = var.zones[0]
  cluster = google_container_cluster.primary.name

  initial_node_count = 3
  #node_count     = var.gke_num_nodes
  #node_locations = var.zones

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  autoscaling {
    total_min_node_count = 3
    total_max_node_count = 10
    location_policy      = "BALANCED"
  }
  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring"
    ]

    # labels = {
    #   env = var.project_name
    # }

    preemptible  = false
    machine_type = var.machine_type
    disk_type    = "pd-ssd" # Type of the disk attached to each node (e.g. 'pd-standard', 'pd-ssd' or 'pd-balanced').
    disk_size_gb = 100      # Smallest allowed disk size is 10GB. Defaults to 100GB.
    tags         = [
      # "<YOUR-PROJECT>-dev-mongodb-tags",
      # "<YOUR-PROJECT>-dev-redis-tags",
      # "<YOUR-PROJECT>-dev-kafka-tags",
      # "<YOUR-PROJECT>-dev-nat-tags",
      #"<YOUR-PROJECT>-dev-internal-tags",
      "ets-gke-dev-source-internal-tags"
      ]
    metadata = {
      disable-legacy-endpoints = "true"
    }
  }
}
