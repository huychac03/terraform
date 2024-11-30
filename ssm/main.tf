resource "google_secret_manager_secret" "<YOUR-PROJECT>-dev-secret-service" {
  secret_id = "<YOUR-PROJECT>-dev-secret-platform-service"

  replication {
    auto {}
  }
}

resource "google_secret_manager_secret" "<YOUR-PROJECT>-dev-secret-web" {
  secret_id = "<YOUR-PROJECT>-dev-secret-platform-web"

  replication {
    auto {}
  }
}