//declare an VPC
resource "google_compute_network" "vpc_network" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
  routing_mode            = "GLOBAL"
}


//declare subnet
resource "google_compute_subnetwork" "public" {
  name          = "${var.vpc_name}-${var.pub_subnet_name}-01"
  ip_cidr_range = var.pub_sub_cidr
  region        = var.subnet_region
  network       = google_compute_network.vpc_network.name
}

resource "google_compute_subnetwork" "private" {
  name          = "${var.vpc_name}-${var.pri_sub_name}-01"
  ip_cidr_range = var.pri_sub_cidr
  region        = var.subnet_region
  network       = google_compute_network.vpc_network.name
  secondary_ip_range = [
    {
      range_name    = var.list_range_name[0]
      ip_cidr_range = var.list_ip_cidr_range[0]
    },
    {
      range_name    = var.list_range_name[1]
      ip_cidr_range = var.list_ip_cidr_range[1]
    },
    {
      range_name    = var.list_range_name[2]
      ip_cidr_range = var.list_ip_cidr_range[2]
    }
  ]
}


#NAT 
resource "google_compute_router" "router" {
  name    = "${var.vpc_name}-router"
  region  = var.subnet_region
  network = google_compute_network.vpc_network.name
}

resource "google_compute_address" "address" {
  name   = "${var.vpc_name}-nat-ip"
  region = google_compute_subnetwork.private.region
}

resource "google_compute_router_nat" "nat_manual" {
  name   = "${var.vpc_name}-nat"
  router = google_compute_router.router.name
  region = google_compute_router.router.region

  nat_ip_allocate_option = var.nat_ip_allocate_option
  nat_ips                = [google_compute_address.address.self_link]

  source_subnetwork_ip_ranges_to_nat = var.source_subnetwork_ip_ranges_to_nat
  subnetwork {
    name                    = google_compute_subnetwork.private.self_link
    source_ip_ranges_to_nat = var.source_ip_ranges_to_nat
  }
  subnetwork {
    name                    = google_compute_subnetwork.public.self_link
    source_ip_ranges_to_nat = var.source_ip_ranges_to_nat
  }
}
