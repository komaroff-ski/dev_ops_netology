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

