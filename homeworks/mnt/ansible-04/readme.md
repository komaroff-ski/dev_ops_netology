## Домашнее задание Ansible-04, С.Г. Комаров

Описание подготовленого playbook-файла site.yml:

Ссылка на playbook: https://github.com/komaroff-ski/dev_ops_netology/blob/main/homeworks/mnt/ansible-04/site.yml


Данный плейбук предназначен для автоматизированной установки и настройки сервисов clickhouse (база данных для хранения лог-файлов) и vector (фильтрация и преобразование поступающих лог-файлов, передача выходных данных в clickhouse) и lighthouse (визулизация логов).

Используем инфраструктуру yandex.cloud, приготовленную при помощи terraform

В плейбуке использованы три роли:
- Clickhouse: https://github.com/komaroff-ski/ksg_clickhouse
- Vector: https://github.com/komaroff-ski/ksg_vector
- LightHouse: https://github.com/komaroff-ski/ksg_lighthouse

В pre tasks отключаем ipv6 на каждой группе хостов
Роли предназначены только для работы на centos, работу с другими ОС не стал реализовывать ввиду дефицита времени. Принцип понятен.