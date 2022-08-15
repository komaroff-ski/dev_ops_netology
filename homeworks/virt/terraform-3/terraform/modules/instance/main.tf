variable "name" {default = ""}
variable "cores" {default = 0}
variable "memory" {default = 0}
variable "instance_count" {default = 0}
variable "subnet_id" {default = ""}
variable "platform" {default = ""}
variable fe_instance {
  type = map(object({
    cores = string
    memory = string
    platform = string
  }))
}

terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

resource "yandex_compute_instance" "vm" {

  count = var.instance_count
  name = "${var.name}-${count.index+1}"

  resources {
    cores  = var.cores
    memory = var.memory
  }

  boot_disk {
    initialize_params {
      image_id = "fd8f5l3798bmqndsmvem"
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }
  platform_id = var.platform
  metadata = {
    ssh-keys = "ubuntu:${file("/home/komaroff/DevOps/git_repo/study/project2/terraform/ssh_keys/id_rsa.pub")}"
  }
}

resource "yandex_compute_instance" "fe_vm" {

  for_each = var.fe_instance
  name = "${var.name}-${each.key}"

  resources {
    cores  = each.value.cores
    memory = each.value.memory
  }

  boot_disk {
    initialize_params {
      image_id = "fd8f5l3798bmqndsmvem"
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }
  platform_id = each.value.platform
  metadata = {
    ssh-keys = "ubuntu:${file("/home/komaroff/DevOps/git_repo/study/project2/terraform/ssh_keys/id_rsa.pub")}"
  }
  lifecycle {
    create_before_destroy = true
  }
}

output "internal_ip_address_vm" {
  value = yandex_compute_instance.vm.*.network_interface.0.ip_address
}
output "external_ip_address_vm" {
  value = yandex_compute_instance.vm.*.network_interface.0.nat_ip_address
}

output "internal_ip_address_fe_vm" {
  value = values(yandex_compute_instance.fe_vm)[*].network_interface.0.ip_address
}
output "external_ip_address_fe_vm" {
  value = values(yandex_compute_instance.fe_vm)[*].network_interface.0.nat_ip_address
}