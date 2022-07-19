## Postgres

#### Создать базу temp_db:
create database temp_db

#### Создать пользователя
CREAtE user "test-admin-user" with password '2222'

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

#### Посмотреть директорию базы:
SHOW DATA_DIRECTORY
