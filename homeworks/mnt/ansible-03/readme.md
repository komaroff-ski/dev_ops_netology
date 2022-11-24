## Домашнее задание Ansible-03, С.Г. Комаров

Описание подготовленого playbook-файла site.yml:

Ссылка на playbook: https://github.com/komaroff-ski/dev_ops_netology/blob/main/homeworks/mnt/ansible-03/site.yml


Данный плейбук предназначен для автоматизированной установки и настройки сервисов clickhouse (база данных для хранения лог-файлов) и vector (фильтрация и преобразование поступающих лог-файлов, передача выходных данных в clickhouse) и lighthouse (визулизация логов).

Используем инфраструктуру yandex.cloud, приготовленную при помощи terraform

#### Описание работы плейбука:

Install Clickhouse:

1. Объявляем play Install Clickhouse, который будет выполняться на группе хостов vector и правами суперпользователя
2. Объявляем handler restart clickhouse service, который будет отвечать за перезапуск сервиса clickhouse после применения новой конфигурации
3. Загружаем дистрибутив clickhouse. Версию дистрибутива сервера и клиента берем из переменной clickhouse_version, которую объявляем в vars.yml
4. Запускаем установку скачанных дистрибутивов посредством встроенного модуля ansible.builtin.yum
5. После установки clickhouse, помещаем сервис в автозапуск и запускаем его, используя модуль ansible.builtin.systemd
6. При помощи модуля ansible.builtin.command выполняем команду для создания базы данных Clickhouse с именем logs
7. Пользуясь модулем ansible.builtin.template, заполняем конфигурационный файл Clickhouse находящийся в папке config, копируем его в папку с конфигурацией Clickhouse на сервере и перезапускаем сервис, используя handler
 
Install Vector:

1. Объявляем play Install LightHouse, который будет выполняться на группе хостов lighthouse и правами суперпользователя
2. Объявляем handler retart vector service, который будет отвечать за перезапуск сервиса vector после применения новой конфигурации
3. Загружаем дистрибутив vector. Версию дистрибутива берем из переменной vector_version, которую объявляем в vars.yml
4. Запускаем установку скачанного дистрибутива посредством встроенного модуля ansible.builtin.yum
5. После установки vector, помещаем сервис в автозапуск и запускаем его, используя модуль ansible.builtin.systemd
6. Пользуясь модулем ansible.builtin.template, заполняем конфигурационный файл vector (поставляем ip-адрес ckickhouse, который взяли из facts), находящийся в папке config, копируем его в папку с конфигурацией vector на сервере и перезапускаем сервис, используя handler

Install LightHouse:
1. Объявляем play Vector, который будет выполняться на группе хостов vector и правами суперпользователя
2. Объявляем handler retart nginx service, который будет отвечать за перезапуск сервиса nginx после применения новой конфигурации
3. Устанавливаем утилиты, необходимые для выполнения дальнейших действий
4. Устанавливаем nginx в качестве web-сервера для LightHouse
3. Загружаем готовый образ LightHouse из git-резозитория в формате .zip
4. Разпаковываем образ LightHouse (unzip) в каталог /usr/share/nginx/html/
5. Переименовываем калалог LightHouse

#### Вывод работы terraform:

```
komaroff@HP-Book:~/DevOps/dev_ops_netology/homeworks/mnt/ansible-03/terraform$ terraform apply

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # yandex_compute_instance.vm-1 will be created
  + resource "yandex_compute_instance" "vm-1" {
      + created_at                = (known after apply)
      + folder_id                 = (known after apply)
      + fqdn                      = (known after apply)
      + hostname                  = (known after apply)
      + id                        = (known after apply)
      + metadata                  = {
          + "ssh-keys" = <<-EOT
                ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCgmbUnCso/GQ4jigRR2UvFHCWa4ZTG3zpO5z052Pxl0cj1sbv2nSWFJA8IR4CEjtr+c4CkdSyxR8pLtH30vg4TaAAjWPkIsXBrq4tQZleDfdWOKbFR8T8rKEAlHJBeWvcy06SP51k/cJ7AVg3liZrIJk1F8D8pDzoXQXWA8KoIYTbQQeWfeNoo3RO3sDWnZBhlGwucZjBjfnu18ZRkZzHIIi7DM3pF9EO7qW1zlU2+mNIYGDE+Y4+3jRU3duq7jyxe1ecfoae9iDmrtm/H5JdHk1kVqRe+Jq02BtBkzg8P8CEHHVvrlQaZsCh/eb4u2N+LS/3z1jGA2eZRYwL3+r09 komaroff@HP-Book
            EOT
        }
      + name                      = "clickhouse1"
      + network_acceleration_type = "standard"
      + platform_id               = "standard-v1"
      + service_account_id        = (known after apply)
      + status                    = (known after apply)
      + zone                      = (known after apply)

      + boot_disk {
          + auto_delete = true
          + device_name = (known after apply)
          + disk_id     = (known after apply)
          + mode        = (known after apply)

          + initialize_params {
              + block_size  = (known after apply)
              + description = (known after apply)
              + image_id    = "fd80le4b8gt2u33lvubr"
              + name        = (known after apply)
              + size        = (known after apply)
              + snapshot_id = (known after apply)
              + type        = "network-hdd"
            }
        }

      + network_interface {
          + index              = (known after apply)
          + ip_address         = (known after apply)
          + ipv4               = true
          + ipv6               = (known after apply)
          + ipv6_address       = (known after apply)
          + mac_address        = (known after apply)
          + nat                = true
          + nat_ip_address     = (known after apply)
          + nat_ip_version     = (known after apply)
          + security_group_ids = (known after apply)
          + subnet_id          = (known after apply)
        }

      + placement_policy {
          + host_affinity_rules = (known after apply)
          + placement_group_id  = (known after apply)
        }

      + resources {
          + core_fraction = 100
          + cores         = 2
          + memory        = 2
        }

      + scheduling_policy {
          + preemptible = (known after apply)
        }
    }

  # yandex_compute_instance.vm-2 will be created
  + resource "yandex_compute_instance" "vm-2" {
      + created_at                = (known after apply)
      + folder_id                 = (known after apply)
      + fqdn                      = (known after apply)
      + hostname                  = (known after apply)
      + id                        = (known after apply)
      + metadata                  = {
          + "ssh-keys" = <<-EOT
                ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCgmbUnCso/GQ4jigRR2UvFHCWa4ZTG3zpO5z052Pxl0cj1sbv2nSWFJA8IR4CEjtr+c4CkdSyxR8pLtH30vg4TaAAjWPkIsXBrq4tQZleDfdWOKbFR8T8rKEAlHJBeWvcy06SP51k/cJ7AVg3liZrIJk1F8D8pDzoXQXWA8KoIYTbQQeWfeNoo3RO3sDWnZBhlGwucZjBjfnu18ZRkZzHIIi7DM3pF9EO7qW1zlU2+mNIYGDE+Y4+3jRU3duq7jyxe1ecfoae9iDmrtm/H5JdHk1kVqRe+Jq02BtBkzg8P8CEHHVvrlQaZsCh/eb4u2N+LS/3z1jGA2eZRYwL3+r09 komaroff@HP-Book
            EOT
        }
      + name                      = "vector1"
      + network_acceleration_type = "standard"
      + platform_id               = "standard-v1"
      + service_account_id        = (known after apply)
      + status                    = (known after apply)
      + zone                      = (known after apply)

      + boot_disk {
          + auto_delete = true
          + device_name = (known after apply)
          + disk_id     = (known after apply)
          + mode        = (known after apply)

          + initialize_params {
              + block_size  = (known after apply)
              + description = (known after apply)
              + image_id    = "fd80le4b8gt2u33lvubr"
              + name        = (known after apply)
              + size        = (known after apply)
              + snapshot_id = (known after apply)
              + type        = "network-hdd"
            }
        }

      + network_interface {
          + index              = (known after apply)
          + ip_address         = (known after apply)
          + ipv4               = true
          + ipv6               = (known after apply)
          + ipv6_address       = (known after apply)
          + mac_address        = (known after apply)
          + nat                = true
          + nat_ip_address     = (known after apply)
          + nat_ip_version     = (known after apply)
          + security_group_ids = (known after apply)
          + subnet_id          = (known after apply)
        }

      + placement_policy {
          + host_affinity_rules = (known after apply)
          + placement_group_id  = (known after apply)
        }

      + resources {
          + core_fraction = 100
          + cores         = 2
          + memory        = 2
        }

      + scheduling_policy {
          + preemptible = (known after apply)
        }
    }

  # yandex_compute_instance.vm-3 will be created
  + resource "yandex_compute_instance" "vm-3" {
      + created_at                = (known after apply)
      + folder_id                 = (known after apply)
      + fqdn                      = (known after apply)
      + hostname                  = (known after apply)
      + id                        = (known after apply)
      + metadata                  = {
          + "ssh-keys" = <<-EOT
                ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCgmbUnCso/GQ4jigRR2UvFHCWa4ZTG3zpO5z052Pxl0cj1sbv2nSWFJA8IR4CEjtr+c4CkdSyxR8pLtH30vg4TaAAjWPkIsXBrq4tQZleDfdWOKbFR8T8rKEAlHJBeWvcy06SP51k/cJ7AVg3liZrIJk1F8D8pDzoXQXWA8KoIYTbQQeWfeNoo3RO3sDWnZBhlGwucZjBjfnu18ZRkZzHIIi7DM3pF9EO7qW1zlU2+mNIYGDE+Y4+3jRU3duq7jyxe1ecfoae9iDmrtm/H5JdHk1kVqRe+Jq02BtBkzg8P8CEHHVvrlQaZsCh/eb4u2N+LS/3z1jGA2eZRYwL3+r09 komaroff@HP-Book
            EOT
        }
      + name                      = "lighthouse1"
      + network_acceleration_type = "standard"
      + platform_id               = "standard-v1"
      + service_account_id        = (known after apply)
      + status                    = (known after apply)
      + zone                      = (known after apply)

      + boot_disk {
          + auto_delete = true
          + device_name = (known after apply)
          + disk_id     = (known after apply)
          + mode        = (known after apply)

          + initialize_params {
              + block_size  = (known after apply)
              + description = (known after apply)
              + image_id    = "fd80le4b8gt2u33lvubr"
              + name        = (known after apply)
              + size        = (known after apply)
              + snapshot_id = (known after apply)
              + type        = "network-hdd"
            }
        }

      + network_interface {
          + index              = (known after apply)
          + ip_address         = (known after apply)
          + ipv4               = true
          + ipv6               = (known after apply)
          + ipv6_address       = (known after apply)
          + mac_address        = (known after apply)
          + nat                = true
          + nat_ip_address     = (known after apply)
          + nat_ip_version     = (known after apply)
          + security_group_ids = (known after apply)
          + subnet_id          = (known after apply)
        }

      + placement_policy {
          + host_affinity_rules = (known after apply)
          + placement_group_id  = (known after apply)
        }

      + resources {
          + core_fraction = 100
          + cores         = 2
          + memory        = 2
        }

      + scheduling_policy {
          + preemptible = (known after apply)
        }
    }

  # yandex_vpc_network.network-1 will be created
  + resource "yandex_vpc_network" "network-1" {
      + created_at                = (known after apply)
      + default_security_group_id = (known after apply)
      + folder_id                 = (known after apply)
      + id                        = (known after apply)
      + labels                    = (known after apply)
      + name                      = "network1"
      + subnet_ids                = (known after apply)
    }

  # yandex_vpc_subnet.subnet-1 will be created
  + resource "yandex_vpc_subnet" "subnet-1" {
      + created_at     = (known after apply)
      + folder_id      = (known after apply)
      + id             = (known after apply)
      + labels         = (known after apply)
      + name           = "subnet1"
      + network_id     = (known after apply)
      + v4_cidr_blocks = [
          + "192.168.50.0/24",
        ]
      + v6_cidr_blocks = (known after apply)
      + zone           = "ru-central1-a"
    }

Plan: 5 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + external_ip_address_vm_1 = (known after apply)
  + external_ip_address_vm_2 = (known after apply)
  + external_ip_address_vm_3 = (known after apply)
  + internal_ip_address_vm_1 = (known after apply)
  + internal_ip_address_vm_2 = (known after apply)
  + internal_ip_address_vm_3 = (known after apply)

Do you want to perform these actions in workspace "prod"?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

yandex_vpc_network.network-1: Creating...
yandex_vpc_network.network-1: Creation complete after 1s [id=enpmthf7fkctds9gm7p3]
yandex_vpc_subnet.subnet-1: Creating...
yandex_vpc_subnet.subnet-1: Creation complete after 1s [id=e9b1bm7vgca285svsi2c]
yandex_compute_instance.vm-3: Creating...
yandex_compute_instance.vm-1: Creating...
yandex_compute_instance.vm-2: Creating...
yandex_compute_instance.vm-3: Still creating... [10s elapsed]
yandex_compute_instance.vm-2: Still creating... [10s elapsed]
yandex_compute_instance.vm-1: Still creating... [10s elapsed]
yandex_compute_instance.vm-3: Still creating... [20s elapsed]
yandex_compute_instance.vm-2: Still creating... [20s elapsed]
yandex_compute_instance.vm-1: Still creating... [20s elapsed]
yandex_compute_instance.vm-2: Still creating... [30s elapsed]
yandex_compute_instance.vm-3: Still creating... [30s elapsed]
yandex_compute_instance.vm-1: Still creating... [30s elapsed]
yandex_compute_instance.vm-1: Creation complete after 32s [id=fhm6a1dlifbsa0v7e9cf]
yandex_compute_instance.vm-2: Creation complete after 35s [id=fhmc3sj89fkq720oa1dl]
yandex_compute_instance.vm-3: Creation complete after 35s [id=fhmbjaj2omo1ebl7ovqn]

Apply complete! Resources: 5 added, 0 changed, 0 destroyed.

Outputs:

external_ip_address_vm_1 = "62.84.118.151"
external_ip_address_vm_2 = "84.201.159.173"
external_ip_address_vm_3 = "62.84.118.63"
internal_ip_address_vm_1 = "192.168.50.5"
internal_ip_address_vm_2 = "192.168.50.32"
internal_ip_address_vm_3 = "192.168.50.25"
```

#### Вывод результатов работы плейбука:

```
komaroff@HP-Book:~/DevOps/dev_ops_netology/homeworks/mnt/ansible-03$ ansible-playbook site.yml -i ./inventory/prod.yml 

PLAY [Install Clickhouse] *******************************************************************************************************************************************************************************************************************

TASK [Gathering Facts] **********************************************************************************************************************************************************************************************************************
ok: [62.84.118.151]

TASK [Get clickhouse distrib] ***************************************************************************************************************************************************************************************************************
ok: [62.84.118.151] => (item=clickhouse-client)
ok: [62.84.118.151] => (item=clickhouse-server)
failed: [62.84.118.151] (item=clickhouse-common-static) => {"ansible_loop_var": "item", "changed": false, "dest": "./clickhouse-common-static-22.3.3.44.rpm", "elapsed": 0, "gid": 0, "group": "root", "item": "clickhouse-common-static", "mode": "0644", "msg": "Request failed", "owner": "root", "response": "HTTP Error 404: Not Found", "secontext": "unconfined_u:object_r:user_home_t:s0", "size": 246310036, "state": "file", "status_code": 404, "uid": 0, "url": "https://packages.clickhouse.com/rpm/stable/clickhouse-common-static-22.3.3.44.noarch.rpm"}

TASK [Get clickhouse distrib] ***************************************************************************************************************************************************************************************************************
ok: [62.84.118.151]

TASK [Install clickhouse packages] **********************************************************************************************************************************************************************************************************
ok: [62.84.118.151]

TASK [Set clickhouse to autorun and start] **************************************************************************************************************************************************************************************************
ok: [62.84.118.151]

TASK [Create database] **********************************************************************************************************************************************************************************************************************
ok: [62.84.118.151]

TASK [Copy config file] *********************************************************************************************************************************************************************************************************************
ok: [62.84.118.151]

PLAY [Install Vector] ***********************************************************************************************************************************************************************************************************************

TASK [Gathering Facts] **********************************************************************************************************************************************************************************************************************
ok: [84.201.159.173]

TASK [Download vector] **********************************************************************************************************************************************************************************************************************
ok: [84.201.159.173]

TASK [Install vector] ***********************************************************************************************************************************************************************************************************************
ok: [84.201.159.173]

TASK [set vector to autorun and start install] **********************************************************************************************************************************************************************************************
ok: [84.201.159.173]

TASK [Copy config file] *********************************************************************************************************************************************************************************************************************
ok: [84.201.159.173]

PLAY [Install LightHouse] *******************************************************************************************************************************************************************************************************************

TASK [Gathering Facts] **********************************************************************************************************************************************************************************************************************
ok: [62.84.118.63]

TASK [Install utils] ************************************************************************************************************************************************************************************************************************
changed: [62.84.118.63]

TASK [Install nginx] ************************************************************************************************************************************************************************************************************************
changed: [62.84.118.63]

TASK [set nginx to autorun and start install] ***********************************************************************************************************************************************************************************************
changed: [62.84.118.63]

TASK [Download lighthouse to local folder] **************************************************************************************************************************************************************************************************
changed: [62.84.118.63]

TASK [unzip lighthouse] *********************************************************************************************************************************************************************************************************************
[WARNING]: Consider using the unarchive module rather than running 'unzip'.  If you need to use command because unarchive is insufficient you can add 'warn: false' to this command task or set 'command_warnings=False' in ansible.cfg to
get rid of this message.
changed: [62.84.118.63]

TASK [copy lighthouse to nginx folder] ******************************************************************************************************************************************************************************************************
changed: [62.84.118.63]

PLAY RECAP **********************************************************************************************************************************************************************************************************************************
62.84.118.151              : ok=6    changed=0    unreachable=0    failed=0    skipped=0    rescued=1    ignored=0   
62.84.118.63               : ok=7    changed=6    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
84.201.159.173             : ok=5    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0  
```