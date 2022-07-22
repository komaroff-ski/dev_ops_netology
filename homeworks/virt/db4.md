## Задача 1

Найдите и приведите управляющие команды для:

вывода списка БД  
\l  
подключения к БД  
\c  
вывода списка таблиц  
\d  
вывода описания содержимого таблиц  
\d table_name  
выхода из psql  
\q  

## Задача 2

Ответ: title, 16
```
select attname, avg_width from pg_stats
where tablename = 'orders' 
and avg_width = (select max(avg_width) from pg_stats where tablename = 'orders'); 
```

## Задача 3

Разделение существующей таблицы (партиционирование):
```
alter table orders rename to orders_old;
create table orders (id integer, title varchar(80), price integer) partition by range(price);
create table orders_1 partition of orders for values from (0) to (499);
create table orders_2 partition of orders for values from (499) to (999999);
insert into orders (id, title, price) select * from orders_old;
drop table orders_old;
```

Избежать ручного разделения таблицы можно, предусмотрев при проектирвании таблицы шардирование по полю price,
(CHECK (price <= 499))
(CHECK (price > 499))
и прописав соотвествующе правила (CREATE RULE rule_name AS ON INSERT ...)

## Задача 4

```
pg_dump -h 192.168.56.11 -U postgres test_database > \home\vagrant\bd\pgsql\backup\test_database_back.sql
```

Для уникальности можно добавить индекс:
```
create unique index title_un ON public.orders(title);

```
