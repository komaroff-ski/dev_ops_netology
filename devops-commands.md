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


