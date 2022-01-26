### GIT

# ДЗ №1

Задача: организовать эффективный и стабильный процесс разработки программного обеспечения в компании.

Roadmap:

1. Провести аудит текущего процесса разработки и вычислительных мощностей компании.
2. Совместно с командой эксплуатации, проанализировать и дать предложения по устранению узких мест в производительности и отказоустойчивости ИТ-инфораструктуры, а так же по оптимизации затрат на её содержание.
3. Совместно со всем участниками процесса разработки выбрать и внедрить единые инструменты для совместной работы (таск-менеджер, мессенджер, система контроля версий etc.) Постоянно работать над автоматизацией работы данных инструментов на всех этапах разработки продукта.
4. Совместно с командой разработчиков и эксплуатации, выбрать и сформировать единообразное окружение для разработки и тестирования.
5. Регламентировать работу разработчиков в части написания тестов (юнит, функциональных, приемочных)
6. Настроить процесс автоматического тестирования написанного кода, в т.ч. в части ИБ
7. Проанализировать и внести изменения в систему обеспечения безопасности и предоставления сотрудникам прав доступа к информационным ресурсам компании. По возможности, автоматизировать процесс предоставления и лишения доступа, в зависимости от статуса и должности сотрудника. Автоматизировать процесс мониторинга доступа к ресурсам.
8. Создать эталонную песочницу. Автоматизировать процесс создания и уничтожения песочнич. Исключить возможность тестирования кода вне "легальных" песочниц. Довести до всех заинтересованных лиц регламент уничтожения песочниц.
9. Совместно с владельцем продукта, выстроить процесс аппрува изменений и помещения их в продакшн. Автоматизировать процесс помещения одобренных владельцем продукта изменений в продакшн. При написании кода и тестировании изменений, группа разработки и группа тестирования должна предусмотреть, описать и протестировать процесс отката изменений.
10. Настроить систему автоматического мониторинга и оповещения об ошибках на продакшн и стэйдж - средах.

# ДЗ №2

Описание работы файла .gitignore в папке terraform:

git будет игнорировать следующие папки и файлы в диретории terraform при выполнении команды git add *

подкаталог /.terraform/ со всем содержимым
файлы с расширением .tfstate и .tfstate.*
файл crash.log
файлы с расширением .tfvars
файлы с override.tf, override.tf.json, а так же файлы вида *_override.tf и *_override.tf.json
файлы .terraformrc и terraform.rc

# ДЗ №3

Вносим изменения в ветку main и коммитим

# ДЗ №4

1. Найдите полный хеш и комментарий коммита, хеш которого начинается на aefea
git log aefea -n 1
aefead2207ef7e2aa5dc81a34aedf0cad4c32545


2. Какому тегу соответствует коммит 85024d3
git show 85024d3
v0.12.23

3. Сколько родителей у коммита b8d720? Напишите их хеши.
git show --format="Commit %h have a next parents:%p" b8d720f83
Два
Commit b8d720f83 have a next parents:56cd7859e 9ea88f22f

4. Перечислите хеши и комментарии всех коммитов которые были сделаны между тегами v0.12.23 и v0.12.24.
426  git log v0.12.23..v0.12.24 --oneline

33ff1c03b (tag: v0.12.24) v0.12.24
b14b74c49 [Website] vmc provider links
3f235065b Update CHANGELOG.md
6ae64e247 registry: Fix panic when server is unreachable
5c619ca1b website: Remove links to the getting started guide's old location
06275647e Update CHANGELOG.md
d5f9411f5 command: Fix bug when using terraform login on Windows
4b6d06cc5 Update CHANGELOG.md
dd01a3507 Update CHANGELOG.md
225466bc3 Cleanup after v0.12.23 release


5. Найдите коммит в котором была создана функция func providerSource, ее определение в коде выглядит так func providerSource(...) (вместо троеточего перечислены аргументы).
git grep "func providerSource" +  git log -L:providerSource:provider_source.go

commit 92d6a30bb4e8fbad0968a9915c6d90435a4a08f6
Author: Martin Atkins <mart@degeneration.co.uk>
Date:   Wed Apr 15 11:48:24 2020 -0700


6. Найдите все коммиты в которых была изменена функция globalPluginDirs
git grep "globalPluginDirs" + git log -L:globalPluginDirs:plugins.go -s | grep commit

commit 78b12205587fe839f10d946ea3fdc06719decb05
commit 52dbf94834cb970b510f2fba853a5b49ad9b1a46
commit 41ab0aef7a0fe030e84018973a64135b11abcd70
commit 66ebff90cdfaa6938f26f908c7ebad8d547fea17
commit 8364383c359a6b738a436d1b7745ccdce178df47

7. Кто автор функции synchronizedWriters?
git log -L:globalPluginDirs:plugins.go -s | grep commit
Ни кто. Такой функции в коде нет.

### Работа в терминале

# ДЗ №1

5:
ОЗУ: 1024
CPU: 2

6:
config.vm.provider "virtualbox" do |v|
  v.memory = 1024
  v.cpus = 2
end

8:
history-size, строка 2629
ignoreboth сокращение для директив ignorespace и ignoredups. Не сохранять в истории строки начинающиеся с пробела и дублирующие предыдущую запись.

9: 
Строка 1201
Это механизм, с помощью которого могут быть сгенерированы произвольные строки.

10:
touch file_{1..100000}
touch file_{1..300000} - Argument list too long
Размер аргумента по умолчанию ограничен 128 кб (константа ARG_MAX)

11:
Проверка наличия катаолга /tmp

12:
vagrant@ksg:~$ mkdir /tmp/new_path_dir/
vagrant@ksg:~$ cp /bin/bash /tmp/new_path_dir/
vagrant@ksg:~$ PATH=/tmp/new_path_dir/:$PATH
vagrant@ksg:~$ type -a bash
bash is /tmp/new_path_dir/bash
bash is /usr/bin/bash
bash is /bin/bash

13:
at - выполняет команду в заданное время
batch - выполняет команду когда это позволяет нагрузка на систему. По умолчанию нагрузка меньше 1,5

# ДЗ №2

1. CD - встроенная команда (программа) командного интерпретатора bash
2. grep -c <some_string> <some_file>
3. systemd
4. ls /etv 2>/dev/pts/2
5. wc < /home/ksg/temp/res.cnf > /home/ksg/temp/res2.cnf
6. 
![image](https://user-images.githubusercontent.com/93157702/151010285-b43141d9-535f-4122-980b-4f33abad4797.png)
![image](https://user-images.githubusercontent.com/93157702/151010423-412a9ce3-fe05-4b96-bc23-21dd83d3df1a.png)

7. Запускается новый экземпляр процесса bash с файловым дескриптором 5 для потока вывода, поток вывода 5 перенаправляется на стандартный вывод (&1). Соотвественно, когда мы с вывод команды echo netology перенаправляем на поток вывода 5 (/proc/$$/fd/5), он выводится посредством стандартного вывода (stdout).

8. ls /ect 5>&2 2>&1 1>&5

9. cat /proc/$$/environ выводит неформатированный перечень переменных окружения. Вывести переменные окружения можко командой env

10. /proc/<PID>/cmdline - содержит полную командную строку процесса со всеми аргументами. Если процесс - это зомби, файл cmdline будет пуст.
    /proc/<PID>/exe - это символическая ссылка, содержащая путь к выполняемой команде.

  11. По всей видимости, процессор поддерживает первую версию набора инструкций SSE:
  ![image](https://user-images.githubusercontent.com/93157702/151021752-4c52c6c2-81a7-4879-bc64-32f53c1906d1.png)

  12. У меня ошибки не возникло, подключение пошло:
  ![image](https://user-images.githubusercontent.com/93157702/151022507-22c4ed10-0edc-45c3-9de5-0832527d4462.png)

  14. Команда tee выполняет чтение из stdin и выполняет запись одновременно в stduot и файл, указанный в качестве параметра. Т.к. команда полностью выполняется под sudo, проблем с записью в файл не возникнет.

### Операционные системы

# ДЗ №1

  1. chdir("/tmp") 
  2. /usr/share/misc/magic.mgc
  3. Нужно выяснить файловый дескриптор вывода лог-файла для данного процесса (lsof -p PID) и перенаправить в этот дескриптор пустую строку (echo > proc/PID/fd/desc_id)
  4. Зомби-процессы не занимают CPU, RAM или IO
  5. 
  ![image](https://user-images.githubusercontent.com/93157702/151144136-2ea65f71-5231-4d30-8762-a763868b7840.png)
  
  6.Системный вызов uname, Part of the utsname information is also accessible via /proc/sys/kernel/{ostype, hostname, osrelease, version, domainname}.
  
  7. cmd1 ; cmd2- последовательное выполнение команд, независимо от результата окончания предыдущей, cmd1 && cmd2 - вторая команда будет выполнена только в случае успешного завершения предыдущей. 
  По идее, если установить set -e то работа сценария будет продолжена в независимости от наличия ошибок и в этом случае && можно не использовать. Но на мой взгляд, это плохая практика т.к. затрудняет багтрекинг.
  
  8. Строго говоря, опция перечислена только одна:
  pipefail - возвращает ошибку последней команды, или 0, если все команды выполнялись без ошибок.
  
 Все остальное - параметры:
  e - выполнять дальше, несмотря на ошибки
  u - рассматривать все неявно заданные переменные как ошибку и завершать выполнение с ненулевым статусом
  x - отображать полные команды со всеми параметрами по мере их выполнения

Такое сочетание параментров и опций bash упрощает поиск и отладку ошибок в скриптах.
  
  9. Самый распространенный процесс -  S    interruptible sleep (waiting for an event to complete)
  Дополнительные к основной заглавной буквы статуса процессов означают:
               <    high-priority (not nice to other users)
               N    low-priority (nice to other users)
               L    has pages locked into memory (for real-time and custom IO)
               s    is a session leader
               l    is multi-threaded (using CLONE_THREAD, like NPTL pthreads do)
               +    is in the foreground process group
                              
# ДЗ №2
