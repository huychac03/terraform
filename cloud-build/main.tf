resource "google_cloudbuild_trigger" "demo-trigger" {
  name            = "<YOUR-PROJECT>-dev-platform-service-cloud-build"
  location        = "asia-southeast1"
  service_account = "projects/<YOUR-PROJECT>/serviceAccounts/cloudaz-sa@<YOUR-PROJECT>.iam.gserviceaccount.com"

  substitutions   = {
    "_APP_PLATFORM_SERVICE"             = "apps/platform-service"
    "_PLATFORM_SERVICE" = "platform-service"
    "_NAMESPACE_DEV"       = "dev"
    "_AWS_CODE_PIPE_IMAGE_REPO_NAME" = "platform-service"
    "_SECRET_NAME"                   = "<YOUR-PROJECT>-dev-secret-platform-service"
  }

  filename = "cloudbuild.yaml"

  included_files  = [
    "apps/platform-service/**"
  ]

  github {
    owner = "<YOUR-PROJECT>VietNam"
    name  = "<YOUR-PROJECT>"
    push {
      branch = "dev"
    }
  }
}

resource "google_cloudbuild_trigger" "trigger-pipeline-2" {
  name            = "<YOUR-PROJECT>-dev-platform-web-cloud-build"
  location        = "asia-southeast1"
  service_account = "projects/<YOUR-PROJECT>/serviceAccounts/cloudaz-sa@<YOUR-PROJECT>.iam.gserviceaccount.com"

  substitutions   = {
    "_APP_PLATFORM_SERVICE"             = "apps/platform-web"
    "_PLATFORM_SERVICE" = "platform-web"
    "_NAMESPACE_DEV"       = "dev"
    "_AWS_CODE_PIPE_IMAGE_REPO_NAME" = "platform-web"
    "_SECRET_NAME"                   = "<YOUR-PROJECT>-dev-secret-platform-web"
  }

  filename = "cloudbuild.yaml"

  included_files  = [
    "apps/platform-web/**"
  ]

  github {
    owner = "<YOUR-PROJECT>VietNam"
    name  = "<YOUR-PROJECT>"
    push {
      branch = "dev"
    }
  }
}