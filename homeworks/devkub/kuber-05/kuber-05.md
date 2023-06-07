## Домашнее задание KUBER-04, С.Г. Комаров

#### Задание 1

1. Создать Deployment приложения frontend из образа nginx с количеством реплик 3 шт.  
2. Создать Deployment приложения backend из образа multitool.  
3. Добавить Service, которые обеспечат доступ к обоим приложениям внутри кластера.  
4. Продемонстрировать, что приложения видят друг друга с помощью Service.  
![image](https://github.com/komaroff-ski/dev_ops_netology/assets/93157702/ef4b384a-639c-4db7-b995-bfd1502295f6)
![image](https://github.com/komaroff-ski/dev_ops_netology/assets/93157702/50e201d8-7dac-4c9d-9e58-5eff51c6b2ea)

5. Предоставить манифесты Deployment и Service в решении, а также скриншоты или вывод команды п.4.  
Манифест frontent и backend: https://github.com/komaroff-ski/dev_ops_netology/blob/2cc07e33e24f5109e7bb9b9e2fb9711aed78b0b0/homeworks/devkub/kuber-05/nginx-depl.yaml

Манифест сервиса: https://github.com/komaroff-ski/dev_ops_netology/blob/2cc07e33e24f5109e7bb9b9e2fb9711aed78b0b0/homeworks/devkub/kuber-05/service.yaml

#### Задание 2
1. Включить Ingress-controller в MicroK8S.  
2. Создать Ingress, обеспечивающий доступ снаружи по IP-адресу кластера MicroK8S так, чтобы при запросе только по адресу открывался frontend а при добавлении /api - backend.  
3. Продемонстрировать доступ с помощью браузера или curl с локального компьютера.  
![image](https://github.com/komaroff-ski/dev_ops_netology/assets/93157702/a4b365ec-90ca-42e2-a61a-db5bbc1816fe)
![image](https://github.com/komaroff-ski/dev_ops_netology/assets/93157702/f2265c4b-b959-44dd-904d-5cd2ddef3e1a)

4. Предоставить манифесты и скриншоты или вывод команды п.2.  
Манифест ingress: https://github.com/komaroff-ski/dev_ops_netology/blob/2cc07e33e24f5109e7bb9b9e2fb9711aed78b0b0/homeworks/devkub/kuber-05/ingress.yaml
