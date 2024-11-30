#GCE gitlabrunner
resource "google_compute_instance" "gce_0" {
  count        = length(var.gce_name)
  name         = var.gce_name[count.index]
  machine_type = var.machine_type[count.index]
  zone         = var.zone
  deletion_protection = false
  boot_disk {
    initialize_params {
      image = var.image
      size  = var.gce_size[count.index]
    }
  }
  network_interface {
    network    = var.gce_network
    subnetwork = var.gce_subnet
    
  }

#   metadata = {
#     "ssh-keys" = <<EOT
#     ${var.ssh-public-key}
#     EOT
#   }

   tags = ["<YOUR-PROJECT>-dev-web-tag","<YOUR-PROJECT>-dev-internal-tags"]  
}

