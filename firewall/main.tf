//declare an firewall
resource "google_compute_firewall" "incoming_rule" {
  name    = var.incoming_rule_name
  network = var.vpc_name

  allow {
    protocol = var.incoming_rule_protocal
    ports    = var.incoming_rule_ports
  }
  source_ranges = var.incoming_rule_source_ranges
  target_tags = var.incoming_rule_tags
  direction   = "INGRESS"
}


resource "google_compute_firewall" "outgoing_rule" {
  name    = var.outgoing_rule_name
  network = var.vpc_name

  allow {
    protocol = var.outgoing_rule_protocol
    ports    = var.outgoing_rule_ports  # Optional, since "all" protocol implies all ports
  }

  destination_ranges = var.outgoing_rule_destination_ranges

  target_tags = var.outgoing_rule_tags
  direction   = "EGRESS"
  priority    = var.outgoing_rule_priority
}


# resource "google_compute_firewall" "allow_gke_to_mongodb" {
#   name    = var.mongodb_name
#   network = var.vpc_name

#   allow {
#     protocol = var.mongodb_protocal
#     ports    = var.mongodb_ports
#   }

#   source_ranges = [var.gke_ip_range]
#   target_tags   = var.mongodb_tags

#   direction = var.mongodb_direction
#   priority  = var.mongodb_priority  
# }

# resource "google_compute_firewall" "allow_gke_to_redis" {
#   name    = var.redis_name
#   network = var.vpc_name

#   allow {
#     protocol = var.redis_protocal
#     ports    = var.redis_ports
#   }

#   source_ranges = [var.gke_ip_range]
#   target_tags   = var.redis_tags

#   direction = var.redis_direction
#   priority  = var.redis_priority  
# }

# resource "google_compute_firewall" "allow_gke_to_kafka" {
#   name    = var.kafka_name
#   network = var.vpc_name

#   allow {
#     protocol = var.kafka_protocal
#     ports    = var.kafka_ports
#   }

#   source_ranges = [var.gke_ip_range]
#   target_tags   = var.kafka_tags

#   direction = var.kafka_direction
#   priority  = var.kafka_priority  
# }

# resource "google_compute_firewall" "allow_gke_to_nat" {
#   name    = var.nat_name
#   network = var.vpc_name

#   allow {
#     protocol = var.nat_protocal
#     ports    = var.nat_ports
#   }

#   source_ranges = [var.gke_ip_range]
#   target_tags   = var.nat_tags

#   direction = var.nat_direction
#   priority  = var.nat_priority  
# }

resource "google_compute_firewall" "allow_internal_traffic" {
  name    = var.internal_name
  network = var.vpc_name

  allow {
    protocol = var.internal_protocal
    ports    = var.internal_ports
  } 
  allow { 
    protocol = "icmp"
  }

  source_ranges = var.list_internal_sources_range

  target_tags   = var.internal_tags

  direction = var.internal_direction
  priority  = var.internal_priority  
}
