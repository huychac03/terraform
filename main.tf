module "vpc" {
  source = "./vpc"
}

# module "gcr" {
#   source = "./gcr"
# }

# module "gce" {
#   source = "./gce"
#   gce_network = module.vpc.vpc_id
#   gce_subnet = module.vpc.pub_subnet_id
#   depends_on = [ module.vpc ]
# }

module "gke" {
  source = "./gke"
  gke_network = module.vpc.vpc_id
  gke_subnet = module.vpc.pri_subnet_id
  list_ip_allocation_policy = module.vpc.list_range_name
  depends_on = [ module.vpc ]
}

# module "storage" {
#   source = "./storage"
# }

# module "redis" {
#   source = "./redis"
#   redis_network = module.vpc.vpc_id
#   depends_on = [ module.vpc ]
# }

module "firewall" {
  source = "./firewall"
  vpc_name = module.vpc.vpc_name
  gke_ip_range = module.gke.gke_cluster_ip_range
  list_internal_sources_range = module.vpc.list_range_ip_cidr
  depends_on = [ module.vpc ]
}

# module "ssm" {
#    source = "./ssm"
# }

# module "cloud-build" {
#   source = "./cloud-build"
# }

module "cloud-armor" {
  source = "./cloud-armor"
}