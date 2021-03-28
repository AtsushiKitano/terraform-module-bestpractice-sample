remote_state {
  backend = "gcs"

  config = {
    bucket = "${get_env("TF_VAR_project")}-state-${get_env("ENV")}"
    prefix = "terragrunt/${path_relative_to_include()}"
  }
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "google" {
  project = "${get_env("TF_VAR_project")}"
}
EOF
}

generate "backend" {
  path = "terraform.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
terraform {
  backend "gcs" {}
}
EOF
}
