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
