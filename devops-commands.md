## Docker

#### Скачать образ с докерхаба:

docker pull ссылка на образ

#### Запустить образ (на примере postges)

docker container run -p 5432:5432 --detach --volume /home/vagrant/db/pgsql/:/home/vagrant/db/pgsql/ postgres

-p - проброс портов из контейнера на хостовую машину один к одному
-- volume подключить папку с хоста в папку внутри контейнера
postgres - image name

#### Зайти в контейнер интерактивно

docker container exec -it 5f141371eacf /bin/bash

#### Запустить образ в docker compose

В папке с конфигурационным файлом (docker-compose.yml) запустить:

docker compose up -d

#### Пример docker-compose.yml для postgres

'''
version: '3.1'

services:

  db:
    image: postgres
    restart: always
    environment:
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: 11111
      PGDATA: "/home/vagrant/db/pgsql/new"
    ports:
      - "5432:5432"
    volumes:
     - /home/vagrant/db/pgsql/new:/home/vagrant/db/pgsql/new
     - /home/backup/db/pgsql:/home/backup/db/pgsql
'''

## Postgres

#### Создать базу temp_db:
create database temp_db

#### Создать пользователей и привилегии
create user "test-admin-user" with password '2222';
create user "test-simple-user" with password '3333';
grant all privileges on all tables in schema public to "test-admin-user";
grant select, insert, update, delete on all tables in schema public to "test-simple-user"

#### Создать таблицу:

create table orders 
(
	id serial primary key not null,
	item_name char(50),
	price int
)

#### Создать ссылку на другую таблицу:
alter table clients
(
	order_id int,
	foreign key (order_id) references orders(id)
)

#### Создать индекс

create unique index counry_index on clients (contry)

#### Посмотреть директорию базы:
SHOW DATA_DIRECTORY

#### Получить список тиблиц в базе:
SELECT table_name FROM information_schema.tables
WHERE table_schema NOT IN ('information_schema','pg_catalog');

#### Получить список баз
SELECT datname FROM pg_database;

#### Командная строка

psql -h 192.168.56.11 -U postgres - подключиться к серверу
\c temp_db - подключиться к базе
\l - список баз

Операторы SQL:

![image](https://user-images.githubusercontent.com/93157702/179782081-83bc5d1a-f8f1-497c-935c-08671ba98213.png)

#### Вставить данные в таблицу

insert into orders (item_name, price) values
('Шоколад', 10),
('Принтер', 3000),
('Книга', 500),
('Монитор', 7000),
('Гитара', 4000);

#### Сколько записей в таблице

select count (*) from clients;

#### Анализ производительности запроса

explain select last_name from clients where order_id notnull  

Расшивровка вывода:  

Используется Seq Scan — последовательное, блок за блоком, чтение данных таблицы clients  
cost=0.00 - затраты на получение первой строки, 13.30 - затраты на получение всех строк  
rows — приблизительное количество возвращаемых строк при выполнении операции Seq Scan  
width — средний размер одной строки в байтах.  

#### Удалить базу:

drop database temp_db with (force);

## ElasticSearch

#### 0. Качаем имидж, при необходимости вносим изменения в докер манифест и собираем свой образ. Пример манифеста:
```
FROM elasticsearch:7.17.4
RUN apt update
RUN apt install nano
RUN echo "path.data: /var/lib/" >> /usr/share/elasticsearch/config/elasticsearch.yml
RUN echo "node.name: netology_test" >> /usr/share/elasticsearch/config/elasticsearch.yml
RUN chmod 0777 /var/lib/
```

#### 1. Разворачиваем в докере. Рекомендация - не менее 3-х нод для систем с промышленной эксплуатацией.
Пример запуска в докере  
docker run -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" my-elastic  
Пример compose-файла:  
```
version: '3'
services:
  elasticsearch:
    image: my-elastic
    container_name: my_elasticsearch
    restart: always
    environment:
      - discovery.type=single-node
      - network.host=0.0.0.0
    ports:
      - 9200:9200
      - 9300:9300
    volumes:
     - /home/vagrant/elastic/db:/home/vagrant/elastic/db
```

#### 2.Основные команды:

Статус кластера:  
curl -X GET "localhost:9200/_cluster/health?pretty"  

Получить список индексов:  
curl -X GET "localhost:9200/_cat/indices?pretty"

Получить список шардов:  
curl -X GET "localhost:9200/_cat/shards?pretty"

Создать индекс ind-1. Рекомендуемое кол-во шард - nodes*3, кол-во реплик nodes*2  
```
curl -X PUT "localhost:9200/ind-1?pretty" -H 'Content-Type: application/json' -d'
{
  "settings": {
    "index": {
      "number_of_shards": 1,  
      "number_of_replicas": 0 
    }
  }
}
'
```

Удалить индексы *ind
```
curl -X DELETE "localhost:9200/ind-*?pretty"
```

Зарегистрировать репозиторий со снапшотами (так же, нужно указать корневую дерикторию в переменной `path.repo` в `elasticsearch.yml`и перезапустить `elasticsearch`)
```
curl -X PUT "localhost:9200/_snapshot/netology_backup?pretty" -H 'Content-Type: application/json' -d'
{
  "type": "fs",
  "settings": {
    "location": "/usr/share/elasticsearch/snapshots"
  }
}
'
```
Создать снапшот:
```
curl -X PUT "localhost:9200/_snapshot/netology_backup/%3Ctest_snapshot_%7Bnow%2Fd%7D%3E?pretty"
```

Восстановить index_name из снапшота:
```
curl -X POST "localhost:9200/_snapshot/netology_backup/test_snapshot_2022.07.29/_restore?pretty" -H 'Content-Type: application/json' -d'
{
  "indices": "index_name"
'
```