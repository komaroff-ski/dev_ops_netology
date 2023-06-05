## Домашнее задание KUBER-02, С.Г. Комаров

#### Задание 1

Создать Deployment приложения, состоящего из двух контейнеров — nginx и multitool. Решить возникшую ошибку.  
После запуска увеличить количество реплик работающего приложения до 2.  
Продемонстрировать количество подов до и после масштабирования.  
![image](https://github.com/komaroff-ski/dev_ops_netology/assets/93157702/a77f9e32-6f81-404e-89b6-4592c9e054d9)
![image](https://github.com/komaroff-ski/dev_ops_netology/assets/93157702/8cde858e-b409-4ddd-b8e0-2787d23ea612)

Создать Service, который обеспечит доступ до реплик приложений из п.1.  
![image](https://github.com/komaroff-ski/dev_ops_netology/assets/93157702/68388cf1-e8f9-4ac9-9540-c31a313142dc)

Создать отдельный Pod с приложением multitool и убедиться с помощью curl, что из пода есть доступ до приложений из п.1.  
![image](https://github.com/komaroff-ski/dev_ops_netology/assets/93157702/44392d78-bd02-4eb2-a7bc-3f29b55801b5)

#### Задание 2

Создать Deployment приложения nginx и обеспечить старт контейнера только после того, как будет запущен сервис этого приложения.
Убедиться, что nginx не стартует. В качестве Init-контейнера взять busybox.
![image](https://github.com/komaroff-ski/dev_ops_netology/assets/93157702/b8dd0749-e389-413b-903b-55afd1e5285c)

Создать и запустить Service. Убедиться, что Init запустился.  
![image](https://github.com/komaroff-ski/dev_ops_netology/assets/93157702/346c1413-11f8-4ca5-8c56-059111e1be6e)

Ссылка на deployment: https://github.com/komaroff-ski/dev_ops_netology/blob/8bbd7c2590fbdafb2cc25035e7979b4f3724894b/homeworks/devkub/kuber-03/nginx-depl.yaml

