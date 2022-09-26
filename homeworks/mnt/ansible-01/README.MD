## Домашнее задание Ansible-01

## Основная часть
1. Попробуйте запустить playbook на окружении из `test.yml`, зафиксируйте какое значение имеет факт `some_fact` для указанного хоста при выполнении playbook'a.

![image](https://user-images.githubusercontent.com/93157702/192365654-4bd5112a-f557-4e34-be30-3f2671b9c92f.png)


4. Проведите запуск playbook на окружении из `prod.yml`. Зафиксируйте полученные значения `some_fact` для каждого из `managed host`.

![image](https://user-images.githubusercontent.com/93157702/192365867-d8788730-ded8-4eab-9bf9-8140bfa38b37.png)

5. Добавьте факты в `group_vars` каждой из групп хостов так, чтобы для `some_fact` получились следующие значения: для `deb` - 'deb default fact', для `el` - 'el default fact'.

7.  Повторите запуск playbook на окружении `prod.yml`. Убедитесь, что выдаются корректные значения для всех хостов.

![image](https://user-images.githubusercontent.com/93157702/192366395-dee30879-1c9e-4061-a6e2-653c24d6f1ad.png)

8. Запустите playbook на окружении `prod.yml`. При запуске `ansible` должен запросить у вас пароль. Убедитесь в работоспособности.

![image](https://user-images.githubusercontent.com/93157702/192367852-e405ba4d-1a1d-42db-86d9-5c031f59bc1f.png)

9. Посмотрите при помощи `ansible-doc` список плагинов для подключения. Выберите подходящий для работы на `control node`.

![image](https://user-images.githubusercontent.com/93157702/192373323-71ff5159-9a38-45bc-aef9-d1954dd56dcf.png)

11. Запустите playbook на окружении `prod.yml`. При запуске `anst ible` должен запросить у вас пароль. Убедитесь что факты `some_fact` для каждого из хостов определены из верных `group_vars`.

![image](https://user-images.githubusercontent.com/93157702/192378580-7ff0bc64-0ce9-4cc7-9af1-b02b4219e9c3.png)

