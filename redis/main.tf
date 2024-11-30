//declare an redis instance
resource "google_redis_instance" "redis" {
  name  = var.instance_name
  count = 1
  tier               = var.instance_tier
  memory_size_gb     = var.instance_memory_size_gb
  region             = var.region
  authorized_network = var.redis_network
  connect_mode       = var.instance_connect_mode
  redis_version      = var.redis_version
  display_name       = "${var.instance_name}-cache"
}


