## Домашнее задание KUBER-05, С.Г. Комаров


### Задание. При деплое приложение web-consumer не может подключиться к auth-db. Необходимо это исправить

1. Установить приложение по команде:
```shell
kubectl apply -f https://raw.githubusercontent.com/netology-code/kuber-homeworks/main/3.5/files/task.yaml
```
2. Выявить проблему и описать.
3. Исправить проблему, описать, что сделано.
4. Продемонстрировать, что проблема решена.

Ответ:  

1. Создаем namespace-ы и устанавливаем приложение:  
![image](https://github.com/komaroff-ski/dev_ops_netology/assets/93157702/7163e9e2-fcb0-42fb-988b-2687d693297e)


2. Смотрим логи пода:  
![image](https://github.com/komaroff-ski/dev_ops_netology/assets/93157702/ed0a3a28-c826-4fcd-9266-77a5da0d783d)


3. Видим, что проблема в том, что сервис не может найти хост auth-db. Проблема в том, что при обращении к хостам в других namespace необходимо указывать полный адрес (fqdn). Вносим правки в деплой:  
```
while true; do curl auth-db.data.svc.cluster.local; sleep 5; done  
```

5. Применяем новые параметры и смотрим логи:  
![image](https://github.com/komaroff-ski/dev_ops_netology/assets/93157702/a06e5dc6-7e1e-4c76-8866-1430d63bd9fd)


#### Видим что все работает, проблема решена.  
