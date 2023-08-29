terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  token     = ""
  cloud_id  = "b1gb0c3umejibjjpp221"
  folder_id = "b1g2qtuk0jrkcupgd36n"
  zone      = "ru-central1-a"
}


# resource "yandex_compute_instance" "vm-1" {
#   name = "terraform1"

#   resources {
#     cores  = 2
#     memory = 2
#   }

#   boot_disk {
#     initialize_params {
#       image_id = "fd8f5l3798bmqndsmvem"
#     }
#   }

#   network_interface {
#     subnet_id = yandex_vpc_subnet.subnet-1.id
#     nat       = true
#   }

#   metadata = {
#     ssh-keys = "ubuntu:${file("ssh_keys/id_rsa.pub")}"
#   }
# }

# resource "yandex_compute_instance" "vm-2" {
#   name = "terraform2"

#   resources {
#     cores  = 4
#     memory = 4
#   }

#   boot_disk {
#     initialize_params {
#       image_id = "fd8f5l3798bmqndsmvem"
#     }
#   }

#   network_interface {
#     subnet_id = yandex_vpc_subnet.subnet-1.id
#     nat       = true
#   }

#   metadata = {
#     ssh-keys = "ubuntu:${file("ssh_keys/id_rsa.pub")}"
#   }
# }

# resource "yandex_vpc_network" "network-1" {
#   name = "network1"
# }

# resource "yandex_vpc_subnet" "subnet-1" {
#   name           = "subnet1"
#   zone           = "ru-central1-a"
#   network_id     = yandex_vpc_network.network-1.id
#   v4_cidr_blocks = ["192.168.10.0/24"]
# }

# output "internal_ip_address_vm_1" {
#   value = yandex_compute_instance.vm-1.network_interface.0.ip_address
# }

# output "internal_ip_address_vm_2" {
#   value = yandex_compute_instance.vm-2.network_interface.0.ip_address
# }


# output "external_ip_address_vm_1" {
#   value = yandex_compute_instance.vm-1.network_interface.0.nat_ip_address
# }

# output "external_ip_address_vm_2" {
#   value = yandex_compute_instance.vm-2.network_interface.0.nat_ip_address
# }

resource "yandex_vpc_network" "network-1" {
  name = "network1"
}

resource "yandex_vpc_subnet" "public" {
  name           = "public"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.network-1.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}

resource "yandex_vpc_subnet" "private" {
  name           = "private"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.network-1.id
  v4_cidr_blocks = ["192.168.20.0/24"]
  route_table_id = "enprsqlgj8ib2sha127a"

}

resource "yandex_vpc_route_table" "default_gw" {
  name = "default_gw"
  network_id = yandex_vpc_network.network-1.id
  static_route {
    destination_prefix = "0.0.0.0/0"
    next_hop_address   = "192.168.10.254"
  }
}

resource "yandex_compute_instance" "nat-public" {
  name = "nat-public"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd80mrhj8fl2oe87o4e1"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.public.id
    nat       = true
    ip_address = "192.168.10.254"
  }

  metadata = {
    ssh-keys = "ubuntu:${file("ssh_keys/id_rsa.pub")}"
  }
}

resource "yandex_compute_instance" "vm-public" {
  name = "vm-public"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd8f5l3798bmqndsmvem"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.public.id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("ssh_keys/id_rsa.pub")}"
  }
}

resource "yandex_compute_instance" "vm-private" {
  name = "vm-private"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd8f5l3798bmqndsmvem"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.private.id
    nat       = false
  }

  metadata = {
    ssh-keys = "ubuntu:${file("ssh_keys/id_rsa.pub")}"
  }
}