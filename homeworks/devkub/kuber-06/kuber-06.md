## Домашнее задание KUBER-06, С.Г. Комаров

#### Задание 1

1. Создать Deployment приложения, состоящего из двух контейнеров и обменивающихся данными.  
2. Создать Deployment приложения, состоящего из контейнеров busybox и multitool.  
3. Сделать так, чтобы busybox писал каждые пять секунд в некий файл в общей директории.  
4. Обеспечить возможность чтения файла контейнером multitool.  
5. Продемонстрировать, что multitool может читать файл, который периодоически обновляется.  
6. Предоставить манифесты Deployment в решении, а также скриншоты или вывод команды из п. 4.

![image](https://github.com/komaroff-ski/dev_ops_netology/assets/93157702/a52bd178-c0f0-499b-9653-4840e478f45f)

Ссылка на деплоймент: https://github.com/komaroff-ski/dev_ops_netology/blob/b28cc1554583c74b8779c2c6ef58fb8c58d6bed1/homeworks/devkub/kuber-06/my-app-depl.yaml




#### Задание 2

1. Создать DaemonSet приложения, состоящего из multitool.
2. Обеспечить возможность чтения файла /var/log/syslog кластера MicroK8S.
3. Продемонстрировать возможность чтения файла изнутри пода.
4. Предоставить манифесты Deployment, а также скриншоты или вывод команды из п. 2.

![image](https://github.com/komaroff-ski/dev_ops_netology/assets/93157702/89db64b8-b835-405b-8827-28037f6fd0ff)

Ссылка на демонсет: https://github.com/komaroff-ski/dev_ops_netology/blob/86a21ee98517ca57c282b0664f8ca9b21155cce1/homeworks/devkub/kuber-06/mtool-ds.yaml
