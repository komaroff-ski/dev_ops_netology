terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
#  token     = "y0_AgAEA7qj9Rb3AATuwQAAAADrYlue-BmbpSBnStuBEkwe__dTDzVWwII"
  service_account_key_file = "authorized_key.json"
  cloud_id  = "b1gb0c3umejibjjpp221"
  folder_id = "b1g2qtuk0jrkcupgd36n"
  zone      = "ru-central1-a"
}

resource "yandex_storage_bucket" "ksg-bucket" {
  bucket = "ksg-bucket"
  access_key = "YCAJEB7GxVdKNWGep9NUsvHY4"
  secret_key = "YCPjZRV0YViMTaJWI_atk90eLaNubSMdqvkPm7uA"
}

resource "yandex_storage_object" "moskitou-object" {
  bucket = "ksg-bucket"
  key = "moskitou"
  source = "/home/komaroff/DevOps/dev_ops_netology/homeworks/kuber/cloud-02/terraform/pics/moskitou.jpg"
  access_key = "YCAJEB7GxVdKNWGep9NUsvHY4"
  secret_key = "YCPjZRV0YViMTaJWI_atk90eLaNubSMdqvkPm7uA"
  acl        = "public-read"
}


# resource "yandex_vpc_network" "network-1" {
#   name = "network1"
# }

# resource "yandex_vpc_subnet" "public" {
#   name           = "public"
#   zone           = "ru-central1-a"
#   network_id     = yandex_vpc_network.network-1.id
#   v4_cidr_blocks = ["192.168.10.0/24"]
# }

# resource "yandex_vpc_subnet" "private" {
#   name           = "private"
#   zone           = "ru-central1-a"
#   network_id     = yandex_vpc_network.network-1.id
#   v4_cidr_blocks = ["192.168.20.0/24"]
#   route_table_id = "enprsqlgj8ib2sha127a"

# }

# resource "yandex_vpc_route_table" "default_gw" {
#   name = "default_gw"
#   network_id = yandex_vpc_network.network-1.id
#   static_route {
#     destination_prefix = "0.0.0.0/0"
#     next_hop_address   = "192.168.10.254"
#   }
# }

# resource "yandex_compute_instance" "nat-public" {
#   name = "nat-public"

#   resources {
#     cores  = 2
#     memory = 2
#   }

#   boot_disk {
#     initialize_params {
#       image_id = "fd80mrhj8fl2oe87o4e1"
#     }
#   }

#   network_interface {
#     subnet_id = yandex_vpc_subnet.public.id
#     nat       = true
#     ip_address = "192.168.10.254"
#   }

#   metadata = {
#     ssh-keys = "ubuntu:${file("ssh_keys/id_rsa.pub")}"
#   }
# }

# resource "yandex_compute_instance" "vm-public" {
#   name = "vm-public"

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
#     subnet_id = yandex_vpc_subnet.public.id
#     nat       = true
#   }

#   metadata = {
#     ssh-keys = "ubuntu:${file("ssh_keys/id_rsa.pub")}"
#   }
# }

# resource "yandex_compute_instance" "vm-private" {
#   name = "vm-private"

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
#     subnet_id = yandex_vpc_subnet.private.id
#     nat       = false
#   }

#   metadata = {
#     ssh-keys = "ubuntu:${file("ssh_keys/id_rsa.pub")}"
#   }
# }