## Домашнее задание MON-02, С.Г. Комаров

1. Опишите основные плюсы и минусы pull и push систем мониторинга.

Push:



Pull:



2. Какие из ниже перечисленных систем относятся к push модели, а какие к pull? А может есть гибридные?

    - Prometheus: pull 
    - TICK: push
    - Zabbix: push
    - VictoriaMetrics: Push & Pull
    - Nagios: pull


```
komaroff@HP-Book:~/DevOps/dev_ops_netology/homeworks/mnt/mon-02/sandbox$ curl http://localhost:8086/ping -v
*   Trying 127.0.0.1:8086...
* TCP_NODELAY set
* Connected to localhost (127.0.0.1) port 8086 (#0)
> GET /ping HTTP/1.1
> Host: localhost:8086
> User-Agent: curl/7.68.0
> Accept: */*
> 
* Mark bundle as not supporting multiuse
< HTTP/1.1 204 No Content
< Content-Type: application/json
< Request-Id: 9386547f-a80f-11eb-8044-000000000000
< X-Influxdb-Version: 1.3.5
< Date: Wed, 28 Apr 2021 10:50:41 GMT
< 
* Connection #0 to host localhost left intact

komaroff@HP-Book:~/DevOps/dev_ops_netology/homeworks/mnt/mon-02/sandbox$ curl http://localhost:8888 -v
*   Trying 127.0.0.1:8888...
* TCP_NODELAY set
* Connected to localhost (127.0.0.1) port 8888 (#0)
> GET / HTTP/1.1
> Host: localhost:8888
> User-Agent: curl/7.68.0
> Accept: */*
> 
* Mark bundle as not supporting multiuse
< HTTP/1.1 200 OK
< Accept-Ranges: bytes
< Cache-Control: public, max-age=3600
< Content-Length: 546
< Content-Type: text/html; charset=utf-8
< Etag: "5462923042"
< Last-Modified: Fri, 29 Sep 2017 23:00:42 GMT
< Vary: Accept-Encoding
< X-Chronograf-Version: 1.3.8.3
< Date: Wed, 28 Apr 2021 10:50:48 GMT
< 
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-type" content="text/html; charset=utf-8"/>
    <title>Chronograf</title>
  <link rel="shortcut icon" href="/favicon.ico"><link href="/chronograf.css" rel="stylesheet"></head>
  <body>
    <div id='react-root' data-basepath=""></div>
  <script type="text/javascript" src="/manifest.0b50876f6444e513725c.js"></script><script type="text/javascript" src="/vendor.36ee797884f822b1fbde.js"></script><script type="text/javascript" src="/app.3eec41dc0f57667d6ff4.js"></script></body>
</html>
* Connection #0 to host localhost left intact

komaroff@HP-Book:~/DevOps/dev_ops_netology/homeworks/mnt/mon-02/sandbox$ curl http://localhost:9092/kapacitor/v1/ping -v
*   Trying 127.0.0.1:9092...
* TCP_NODELAY set
* Connected to localhost (127.0.0.1) port 9092 (#0)
> GET /kapacitor/v1/ping HTTP/1.1
> Host: localhost:9092
> User-Agent: curl/7.68.0
> Accept: */*
> 
* Mark bundle as not supporting multiuse
< HTTP/1.1 204 No Content
< Content-Type: application/json; charset=utf-8
< Request-Id: 9af33711-a80f-11eb-8033-000000000000
< X-Kapacitor-Version: 1.3.3
< Date: Wed, 28 Apr 2021 10:50:54 GMT
< 
* Connection #0 to host localhost left intact
```

![image](https://user-images.githubusercontent.com/93157702/209483375-e7ec1e99-f76a-4ea2-927f-c3f8f58198af.png)


![image](https://user-images.githubusercontent.com/93157702/209483378-72add4b3-52d5-4b44-b7b7-c2e52594795c.png)


![image](https://user-images.githubusercontent.com/93157702/209483380-ad301f7f-5cbe-4c65-8704-80c8ee2f2b13.png)
