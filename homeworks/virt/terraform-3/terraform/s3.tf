terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"

  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "project2"
    region     = "ru-central1"
    key        = "project2/terraform.tfstate"
    access_key = "YCAJEAVN5vBeCh9F6QJtOa0rM"
    secret_key = "YCOTZyYbldp7RD1PqccPz540fsVOQa5ytSuIaV5Q"
    skip_region_validation      = true
    skip_credentials_validation = true
  }
}