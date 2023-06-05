## Домашнее задание KUBER-04, С.Г. Комаров

#### Задание 1

1. Создать Deployment приложения, состоящего из двух контейнеров (nginx и multitool), с количеством реплик 3 шт.  
2. Создать Service, который обеспечит доступ внутри кластера до контейнеров приложения из п.1 по порту 9001 — nginx 80, по 9002 — multitool 8080.  
3. Создать отдельный Pod с приложением multitool и убедиться с помощью curl, что из пода есть доступ до приложения из п.1 по разным портам в разные контейнеры.  
4. Продемонстрировать доступ с помощью curl по доменному имени сервиса.  
![image](https://github.com/komaroff-ski/dev_ops_netology/assets/93157702/d9054a92-7865-4992-90ed-67a041d525ee)

5. Предоставить манифесты Deployment и Service в решении, а также скриншоты или вывод команды п.4.  
Deployment приложения:https://github.com/komaroff-ski/dev_ops_netology/blob/3ffd98f642aed8b77e6789a1cb674e38a4e89b33/homeworks/devkub/kuber-04/nginx-depl.yaml
Сервис для доступа внутри кубера:https://github.com/komaroff-ski/dev_ops_netology/blob/3ffd98f642aed8b77e6789a1cb674e38a4e89b33/homeworks/devkub/kuber-04/service.yaml


#### Задание 2

1. Создать отдельный Service приложения из Задания 1 с возможностью доступа снаружи кластера к nginx, используя тип NodePort.
2. Продемонстрировать доступ с помощью браузера или curl с локального компьютера.
![image](https://github.com/komaroff-ski/dev_ops_netology/assets/93157702/6af31275-6f32-4053-9ad6-ff9f8fb490e8)

3. Предоставить манифест и Service в решении, а также скриншоты или вывод команды п.2.
Сервис для доступа с ноды: https://github.com/komaroff-ski/dev_ops_netology/blob/3ffd98f642aed8b77e6789a1cb674e38a4e89b33/homeworks/devkub/kuber-04/service-np.yaml
