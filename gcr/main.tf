resource "google_artifact_registry_repository" "repo" {
  location      = "asia-southeast1"
  repository_id = "<YOUR-PROJECT>-dev-registry"
  format        = "DOCKER"
  
  /*docker_config {
    immutable_tags = false
  }*/
}