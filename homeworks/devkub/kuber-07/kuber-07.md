## Домашнее задание KUBER-07, С.Г. Комаров

#### Задание 1

1. Cоздать Deployment приложения, состоящего из контейнеров busybox и multitool.  
2. Создать PV и PVC для подключения папки на локальной ноде, которая будет использована в поде.  
3. Продемонстрировать, что multitool может читать файл, в который busybox пишет каждые пять секунд в общей директории.
![image](https://github.com/komaroff-ski/dev_ops_netology/assets/93157702/54b141d2-f509-4c90-b7ad-75bfcc5acdba)


4. Удалить Deployment и PVC. Продемонстрировать, что после этого произошло с PV. Пояснить, почему. 
    - PV находится в статусе Released т.к. удаленный под его освободил для новых подключений.
![image](https://github.com/komaroff-ski/dev_ops_netology/assets/93157702/9aea1e17-8e68-43be-a6f3-a6019f2b33ab)


5. Продемонстрировать, что файл сохранился на локальном диске ноды. Удалить PV. Продемонстрировать что произошло с файлом после удаления PV.   Пояснить, почему.  
   - Файл остался на диске т.к. действует политика persistentVolumeReclaimPolicy: Retain  
![image](https://github.com/komaroff-ski/dev_ops_netology/assets/93157702/58de52e5-3a3a-4c5e-aa62-3af3a109902b)


6. Предоставить манифесты, а также скриншоты или вывод необходимых команд.  
Приложение: https://github.com/komaroff-ski/dev_ops_netology/blob/7a678638777c9049e6e645115774eb5d1bef2f87/homeworks/devkub/kuber-07/my-app-depl.yaml  
PV: https://github.com/komaroff-ski/dev_ops_netology/blob/main/homeworks/devkub/kuber-07/pv-nfs.yaml


#### Задание 2
