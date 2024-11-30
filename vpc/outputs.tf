output "vpc_id" {
  value = google_compute_network.vpc_network.self_link
}

output "vpc_name" {
  value = google_compute_network.vpc_network.name
}

//Output of an network subnet
output "pub_subnet_id" {
  value = google_compute_subnetwork.public.self_link
}

output "pri_subnet_id" {
  value = google_compute_subnetwork.private.self_link
}

output "list_range_name" {
  value = var.list_range_name
  
}

output "list_range_ip_cidr" {
  value = var.list_ip_cidr_range
  
}
