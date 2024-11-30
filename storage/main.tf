resource "google_storage_bucket" "bucket" {
  name          = var.bucket_name
  location      = var.location
  storage_class = var.storage_class
  force_destroy = false
  uniform_bucket_level_access = true

#   lifecycle_rule {
#     condition {
#       age = var.lifecycle_rule_condition_age  # Example condition: delete objects older than 30 days
#     }
#     action {
#       type = "Delete"
#     }
#   }

}

