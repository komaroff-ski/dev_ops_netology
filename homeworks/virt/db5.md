## Задача 1

![image](https://user-images.githubusercontent.com/93157702/181758864-8acf5035-2aa8-46a0-8fb2-0048df591715.png)

https://hub.docker.com/repository/docker/komaroffski/elastic

![image](https://user-images.githubusercontent.com/93157702/181759261-efad5743-7551-4d78-92ea-42e7be8cc330.png)


## Задача 2

![image](https://user-images.githubusercontent.com/93157702/181720700-3a5b8160-9a12-4222-9f4e-7749b8d72746.png)

![image](https://user-images.githubusercontent.com/93157702/181720876-cc891a3a-08a3-403d-abc7-295ea3adecd9.png)

Кластер находится в yellow т.к. работает всего-лишь одна нода и часть шард находятся в состоянии unassigned
Индексы 2 и 3 находится в yellow т.к. часть шард находятся в состоянии unassigned

## Задача 3

Создайте директорию `{путь до корневой директории с elasticsearch в образе}/snapshots`.

Используя API [зарегистрируйте](https://www.elastic.co/guide/en/elasticsearch/reference/current/snapshots-register-repository.html#snapshots-register-repository) 
данную директорию как `snapshot repository` c именем `netology_backup`.

**Приведите в ответе** запрос API и результат вызова API для создания репозитория.

![image](https://user-images.githubusercontent.com/93157702/181743408-888373dc-4903-43ae-82a3-64e859a66e80.png)


![image](https://user-images.githubusercontent.com/93157702/181743208-5a44317e-b1e3-48d5-8f13-70db2a359ae7.png)

Создайте индекс `test` с 0 реплик и 1 шардом и **приведите в ответе** список индексов.

[Создайте `snapshot`](https://www.elastic.co/guide/en/elasticsearch/reference/current/snapshots-take-snapshot.html) 
состояния кластера `elasticsearch`.

**Приведите в ответе** список файлов в директории со `snapshot`ами.

![image](https://user-images.githubusercontent.com/93157702/181742866-b58e4876-b520-4bd4-adae-25185dfada5a.png)

Удалите индекс `test` и создайте индекс `test-2`. **Приведите в ответе** список индексов.

![image](https://user-images.githubusercontent.com/93157702/181743893-47808af4-be58-431f-b9e1-a983c3f9d066.png)

[Восстановите](https://www.elastic.co/guide/en/elasticsearch/reference/current/snapshots-restore-snapshot.html) состояние
кластера `elasticsearch` из `snapshot`, созданного ранее. 

**Приведите в ответе** запрос к API восстановления и итоговый список индексов.

![image](https://user-images.githubusercontent.com/93157702/181748155-293d0779-744f-400c-bdef-82818aaa5b64.png)
