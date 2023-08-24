## Домашнее задание KUBER-03, С.Г. Комаров

#### Задание 1. Создать сетевую политику или несколько политик для обеспечения доступа  
- Создать deployment'ы приложений frontend, backend и cache и соответсвующие сервисы.  
- В качестве образа использовать network-multitool.  
- Разместить поды в namespace App.  
- Создать политики, чтобы обеспечить доступ frontend -> backend -> cache. Другие виды подключений должны быть запрещены.  
- Продемонстрировать, что трафик разрешён и запрещён.  


#### Ответ:
Для ограничения доступа использовал calico network policy  
Файл конфигурации сетевой политики:

Информация о созданных подах:

![image](https://github.com/komaroff-ski/dev_ops_netology/assets/93157702/8e55c3ea-d5fe-47b3-8e94-7081cadc74b4)

#### Демонтрация работы политики.

frontend:
![image](https://github.com/komaroff-ski/dev_ops_netology/assets/93157702/4255a9b3-b4df-478b-805d-13da7dcc4371)

backend:
![image](https://github.com/komaroff-ski/dev_ops_netology/assets/93157702/a1f53850-b6ae-44c0-b8bf-338bb7f08f8f)

cache:
![image](https://github.com/komaroff-ski/dev_ops_netology/assets/93157702/96256e18-a33b-4f7c-bd36-dab968c0e500)



