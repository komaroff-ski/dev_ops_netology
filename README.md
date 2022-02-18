## Домашние задания по курсу DevOps (Нетология). Комаров С.Г.

1. [Работа с GIT](#git)  
  1.1 [ДЗ №1](#git_1)  
  1.2 [ДЗ №2](#git_2)  
  1.3 [ДЗ №3](#git_3)  
  1.4 [ДЗ №4](#git_4)  
2. [Работа в терминале](#term)  
  2.1 [ДЗ №1](#term_1)  
  2.2 [ДЗ №2](#term_2)  
3. [Операционные системы](#os)  
  3.1 [ДЗ №1](#os_1)  
  3.2 [ДЗ №2](#os_2)  
4. [Файловые системы](#fs)  
  4.1 [ДЗ №1](#fs_1)  
5. [Компьютерные сети](#net)
  5.1 [ДЗ №1](#net_1)
  5.2 [ДЗ №1](#net_2)
  
---------------

## Работа с GIT
<a name="git"></a>

<a name="git_1"></a>
#### GIT ДЗ №1
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

<a name="git_2"></a>
#### ДЗ №2

Описание работы файла .gitignore в папке terraform:

git будет игнорировать следующие папки и файлы в диретории terraform при выполнении команды git add *

подкаталог /.terraform/ со всем содержимым
файлы с расширением .tfstate и .tfstate.*
файл crash.log
файлы с расширением .tfvars
файлы с override.tf, override.tf.json, а так же файлы вида *_override.tf и *_override.tf.json
файлы .terraformrc и terraform.rc

<a name="git_3"></a>
#### ДЗ №3

Вносим изменения в ветку main и коммитим

<a name="git_4"></a>
#### ДЗ №4

1. Найдите полный хеш и комментарий коммита, хеш которого начинается на aefea
```
git log aefea -n 1
aefead2207ef7e2aa5dc81a34aedf0cad4c32545
```

2. Какому тегу соответствует коммит 85024d3
```
git show 85024d3
v0.12.23
```

3. Сколько родителей у коммита b8d720? Напишите их хеши.
git show --format="Commit %h have a next parents:%p" b8d720f83
Два
Commit b8d720f83 have a next parents:56cd7859e 9ea88f22f

4. Перечислите хеши и комментарии всех коммитов которые были сделаны между тегами v0.12.23 и v0.12.24.
```
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
```

5. Найдите коммит в котором была создана функция func providerSource, ее определение в коде выглядит так func providerSource(...) (вместо троеточего перечислены аргументы).
git grep "func providerSource" +  git log -L:providerSource:provider_source.go

commit 92d6a30bb4e8fbad0968a9915c6d90435a4a08f6
Author: Martin Atkins <mart@degeneration.co.uk>
Date:   Wed Apr 15 11:48:24 2020 -0700


6. Найдите все коммиты в которых была изменена функция globalPluginDirs
```
git grep "globalPluginDirs" + git log -L:globalPluginDirs:plugins.go -s | grep commit

commit 78b12205587fe839f10d946ea3fdc06719decb05
commit 52dbf94834cb970b510f2fba853a5b49ad9b1a46
commit 41ab0aef7a0fe030e84018973a64135b11abcd70
commit 66ebff90cdfaa6938f26f908c7ebad8d547fea17
commit 8364383c359a6b738a436d1b7745ccdce178df47
```

7. Кто автор функции synchronizedWriters?
git log -L:globalPluginDirs:plugins.go -s | grep commit
Ни кто. Такой функции в коде нет.

<a name="term"></a>
## Работа в терминале

<a name="term_1"></a>
#### ДЗ №1

5:
ОЗУ: 1024
CPU: 2

6:
```
config.vm.provider "virtualbox" do |v|
  v.memory = 1024
  v.cpus = 2
end
```
8:
history-size, строка 2629
ignoreboth сокращение для директив ignorespace и ignoredups. Не сохранять в истории строки начинающиеся с пробела и дублирующие предыдущую запись.

9: 
Строка 1201
Это механизм, с помощью которого могут быть сгенерированы произвольные строки.

10:
```
touch file_{1..100000}
touch file_{1..300000} - Argument list too long
```
Размер аргумента по умолчанию ограничен 128 кб (константа ARG_MAX)

11:
Проверка наличия катаолга /tmp

12:
```
vagrant@ksg:~$ mkdir /tmp/new_path_dir/
vagrant@ksg:~$ cp /bin/bash /tmp/new_path_dir/
vagrant@ksg:~$ PATH=/tmp/new_path_dir/:$PATH
vagrant@ksg:~$ type -a bash
bash is /tmp/new_path_dir/bash
bash is /usr/bin/bash
bash is /bin/bash
```

13:
at - выполняет команду в заданное время
batch - выполняет команду когда это позволяет нагрузка на систему. По умолчанию нагрузка меньше 1,5

<a name="term_2"></a>
#### ДЗ №2

1. CD - встроенная команда (программа) командного интерпретатора bash
2. `grep -c <some_string> <some_file>`
3. `systemd`
4. `ls /etv 2>/dev/pts/2`
5. `wc < /home/ksg/temp/res.cnf > /home/ksg/temp/res2.cnf`
6. 
![image](https://user-images.githubusercontent.com/93157702/151010285-b43141d9-535f-4122-980b-4f33abad4797.png)
![image](https://user-images.githubusercontent.com/93157702/151010423-412a9ce3-fe05-4b96-bc23-21dd83d3df1a.png)

7. Запускается новый экземпляр процесса bash с файловым дескриптором 5 для потока вывода, поток вывода 5 перенаправляется на стандартный вывод (&1). Соотвественно, когда мы с вывод команды echo netology перенаправляем на поток вывода 5 (/proc/$$/fd/5), он выводится посредством стандартного вывода (stdout).

8. `ls /ect 5>&2 2>&1 1>&5`

9. `cat /proc/$$/environ` выводит неформатированный перечень переменных окружения. Вывести переменные окружения можко командой env

10. `/proc/<PID>/cmdline` - содержит полную командную строку процесса со всеми аргументами. Если процесс - это зомби, файл cmdline будет пуст.
    `/proc/<PID>/exe` - это символическая ссылка, содержащая путь к выполняемой команде.

11. По всей видимости, процессор поддерживает первую версию набора инструкций SSE:
  ![image](https://user-images.githubusercontent.com/93157702/151021752-4c52c6c2-81a7-4879-bc64-32f53c1906d1.png)

12. Причина ошибки:

По умолчанию, когда вы запускаете команду на удаленном компьютере с помощью ssh, TTY не выделяется для удаленного сеанса. Это позволяет передавать двоичные данные и т. Д. Без необходимости работать с причудами TTY. Это среда, предусмотренная для команды, выполняемой на computerone. Однако, когда вы запускаете ssh без удаленной команды, он выделяет TTY, потому что вы, скорее всего, будете запускать сеанс оболочки. Это ожидается ssh otheruser@computertwo.com командой, но из-за предыдущего объяснения для этой команды нет доступного TTY.

Изменить поведение системы по-умолчанию можно, добавив следующие параметры в файл ~/.ssh/config:
```
Host localhost
  User vagrant
  RequestTTY Yes
```
или запустив ssh c опцией `RequestTTY Yes`
`ssh -o 'RequestTTY YES' localhost 'tty'`

13. Получилось сделать следующее:

```
vagrant@vagrant:~$ top
vagrant@vagrant:~$ bg top
vagrant@vagrant:~$ job -l
1675
vagrant@vagrant:~$ tmux
vagrant@vagrant:~$ reptyr 1675
```

14. Команда tee выполняет чтение из stdin и выполняет запись одновременно в stduot и файл, указанный в качестве параметра. Т.к. команда полностью выполняется под sudo, проблем с записью в файл не возникнет.

<a name="os"></a>
## Операционные системы

<a name="os_1"></a>
#### ДЗ №1

  1. `chdir("/tmp") `
  2. `/usr/share/misc/magic.mgc`
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
  ```
               <    high-priority (not nice to other users)
               N    low-priority (nice to other users)
               L    has pages locked into memory (for real-time and custom IO)
               s    is a session leader
               l    is multi-threaded (using CLONE_THREAD, like NPTL pthreads do)
               +    is in the foreground process group
```

<a name="os_2"></a>			      
#### ДЗ №2
1. 
![image](https://user-images.githubusercontent.com/93157702/151344983-634217e2-2cac-45dc-ac57-a929690067cc.png)

![image](https://user-images.githubusercontent.com/93157702/151820817-f3227abb-c957-419a-97d0-7564a14cf85c.png)

![image](https://user-images.githubusercontent.com/93157702/151820907-a09330c0-7b60-4438-9e70-38e3c8f833e2.png)

![image](https://user-images.githubusercontent.com/93157702/151821123-80c149de-a565-4886-99af-55ced3f4b279.png)

2. Опции для базового мониторинга по CPU, памяти, диску и сети:
															
--collector.uname
--collector.cpu
--collector.diskstats
--collector.netstat
--collector.meminfo
                              
3.
![image](https://user-images.githubusercontent.com/93157702/151349726-161d7791-02f3-4d07-b74f-bc0bc93fbcd9.png)

4.Да, можно:  DMI: innotek GmbH VirtualBox/VirtualBox, BIOS VirtualBox 12/01/2006
	      
5. `fs.nr_open = 1048576`
`fs.nr_open` - системынй лимит на количество открытых файловых дескрипторов
`ulimit -n` - максимальное кол-во открытых файловых дескрипторов на уровне shell. По умолчанию - 1024
6.
![image](https://user-images.githubusercontent.com/93157702/151400292-57b44300-8e14-4d7f-a346-42d86a9c4529.png)

7.			      

`:(){ :|:& };:` -Fork Bomb, функция которая бесконечно удваивает сама себя.
			      
  ![image](https://user-images.githubusercontent.com/93157702/151402211-031829c7-39e9-4fef-879e-b8467c9d8bcd.png)

Автоматической стабилизации помог pids controller из пакета cgroup		      
Текущее ограничение:
![image](https://user-images.githubusercontent.com/93157702/151410148-a9141c61-5504-4cd4-90a1-36235822af2a.png)
Поменять можно командой ulimit -u для данной сессии или перманентно в файле /etc/systemd/system.conf, значение DefaultTasksMax

<a name="fs"></a>
## Файловые системы

<a name="fs_1"></a>	
#### ДЗ №1
	
4. Создал разделы fdisk-ом:
 ![image](https://user-images.githubusercontent.com/93157702/151442905-375b5b80-337e-4925-a49c-83215e00149c.png)
			      
5. Скопировал разделы:			      
![image](https://user-images.githubusercontent.com/93157702/151443078-225cc0a1-d607-4de8-9caf-7f681db9939d.png)

6. 			      
![image](https://user-images.githubusercontent.com/93157702/151446076-60f39e16-b46b-4bdf-ac9a-cc717a832669.png)

7.
![image](https://user-images.githubusercontent.com/93157702/151447132-047bc278-3137-478f-b474-c94e4b94d5af.png)

8.
![image](https://user-images.githubusercontent.com/93157702/151531515-adb13cd5-4705-4b06-810c-04391e3b2e80.png)

9.
![image](https://user-images.githubusercontent.com/93157702/151532171-23ce0410-297e-4918-8a80-6399c170baa1.png)

10.
![image](https://user-images.githubusercontent.com/93157702/151534064-fb5edbf2-2134-48f0-bd32-85b1b140d010.png)

14.
![image](https://user-images.githubusercontent.com/93157702/151535734-d2da404b-29bc-48e9-b30b-f29cb23bb413.png)
			      
16.
![image](https://user-images.githubusercontent.com/93157702/151536744-f6087fed-1796-496e-8080-3d9706bddc70.png)
			      
18.
![image](https://user-images.githubusercontent.com/93157702/151540289-37767c26-8e3b-4165-a71c-4de68ae22749.png)

19.
![image](https://user-images.githubusercontent.com/93157702/151540766-329d8e0b-82ce-4bb1-b9ea-5b12e69bd461.png)

<a name="net"></a>
## Компьютерные сети

<a name="net_1"></a>	
#### ДЗ №1

1.
![image](https://user-images.githubusercontent.com/93157702/154647903-ddc6a91f-11a9-4ed9-9e17-180bee0596ba.png)

По выводу мы видим, что сайт переехал навсегда на https://.. и перенаправление по адерсу https://stackoverflow.com/

2.
![image](https://user-images.githubusercontent.com/93157702/154654691-98dba89c-e644-41d3-8532-547c1ad8b5a8.png)

![image](https://user-images.githubusercontent.com/93157702/154655128-3e0a9fb7-850e-4e45-bf83-42ecdeb77a2e.png)

3.
```
ksg@vagrant:~$ whois 46.39.45.211
% This is the RIPE Database query service.
% The objects are in RPSL format.
%
% The RIPE Database is subject to Terms and Conditions.
% See http://www.ripe.net/db/support/db-terms-conditions.pdf

% Note: this output has been filtered.
%       To receive output for a database update, use the "-B" flag.

% Information related to '46.39.45.0 - 46.39.45.255'

% Abuse contact for '46.39.45.0 - 46.39.45.255' is 'netadm@comcor.ru'

inetnum:        46.39.45.0 - 46.39.45.255
netname:        AKADO-STOLITSA-HFC
descr:          public net at CMTS04-E02
country:        RU
admin-c:        NC2391-RIPE
tech-c:         NC2391-RIPE
status:         ASSIGNED PA
mnt-by:         COMTV-MNT
mnt-lower:      COMTV-MNT
mnt-routes:     COMTV-MNT
created:        2013-11-29T04:57:51Z
last-modified:  2013-11-29T04:57:51Z
source:         RIPE

role:           AKADO-Stolitsa NOC
address:        Russia, 117535, Moscow
address:        Varshavskoe Road, 133
phone:          +7 (495) 662 5430
phone:          +7 (499) 940 0044
fax-no:         +7 (495) 737 5194
remarks:        ----------------------------------------------
remarks:        AKADO-Stolitsa working hours:
remarks:        09am-6pm MSK/MSD (GMT+3/+4) work days
remarks:        ----------------------------------------------
abuse-mailbox:  netadm@akado-telecom.ru
mnt-by:         COMTV-MNT
admin-c:        OVB3-RIPE
tech-c:         BAM1978-RIPE
tech-c:         RAY39-RIPE
tech-c:         KPN6-RIPE
nic-hdl:        NC2391-RIPE
created:        2009-11-09T11:15:13Z
last-modified:  2021-02-17T12:19:56Z
source:         RIPE # Filtered

% Information related to '46.39.32.0/19AS15582'

route:          46.39.32.0/19
descr:          JSC "AKADO-Stolitsa"
origin:         AS15582
mnt-by:         COMTV-MNT
created:        2011-06-15T09:25:33Z
last-modified:  2011-06-15T09:25:33Z
source:         RIPE

% This query was served by the RIPE Database Query Service version 1.102.2 (WAGYU)
```

4.
IP: 46.39.45.211
Провайдер: AKADO-Stolitsa
AS: 15582

5. С traceroute какой-то косяк, с ходу не получилось разобраться. Предполагаю что проблема в конфигурации сети виртуальной машины:
![image](https://user-images.githubusercontent.com/93157702/154663357-2c284c65-4607-4763-801c-f7105c8e0745.png)

6. А вот mtr работает, как ни странно:
![image](https://user-images.githubusercontent.com/93157702/154663798-506342f5-418f-46bc-9e95-3ca352b7b61a.png)

7.
![image](https://user-images.githubusercontent.com/93157702/154664277-ff0a5313-bc21-4d10-a022-5778e340beff.png)

8.
![image](https://user-images.githubusercontent.com/93157702/154666536-7aab8471-f754-42ea-a662-aac14fed32d6.png)

<a name="net_2"></a>	
#### ДЗ №1

1.
![image](https://user-images.githubusercontent.com/93157702/154667880-7f358487-0a00-49a7-a4dd-7e42a79f339a.png)

![image](https://user-images.githubusercontent.com/93157702/154696519-2c6c53ee-7fd8-49e6-a64a-3aea8ed35875.png)

![image](https://user-images.githubusercontent.com/93157702/154696604-890ecd75-eba4-4496-bdf0-74e9bd2c5019.png)

2. Протокол LLDP. Реализация в linux - пакет lldpd. Просмотр информации о соседях по сети: lldpcli show neighbors
3. Для разделения L2 коммутатора на несколько виртуальных сетей используется технология vlan. В linux используем пакет, который так и называется - vlan.
Для создания vlan 200 добавляем новый интерфейс:
`vconfig add eth0 200`
после этого отредактируем файл /etc/network/interfaces для того, чтобы интерфейс поднимался каждый раз после перезагрузки системы, а так же назначим ip.
```
#interface loopback
auto lo
iface lo inet loopback
#Interface eth0 - untagged 
auto eth0
iface eth0 inet static
      address 192.168.10.10
      netmask 255.255.255.0
      gateway 192.168.10.1
      dns-nameservers 8.8.8.8
#Interface eth0.200 - tagged vlan 200
auto eth0.200
iface eth0.200 inet static
      address 192.168.8.10
      netmask 255.255.255.0
#Interface eth1 - untagged 
#auto eth1
#iface eth1 inet dhcp
```

4. Типы объединения и балансировки нагрузки на сетевые интерфейсы в linux:

```
mode=0 (balance-rr)
При этом методе объединения трафик распределяется по принципу «карусели»: пакеты по очереди направляются на сетевые карты объединённого интерфейса. Например, если у нас есть физические интерфейсы eth0, eth1, and eth2, объединенные в bond0, первый пакет будет отправляться через eth0, второй — через eth1, третий — через eth2, а четвертый снова через eth0 и т.д.

mode=1 (active-backup)
Когда используется этот метод, активен только один физический интерфейс, а остальные работают как резервные на случай отказа основного.

mode=2 (balance-xor)
В данном случае объединенный интерфейс определяет, через какую физическую сетевую карту отправить пакеты, в зависимости от MAC-адресов источника и получателя.

mode=3 (broadcast) Широковещательный режим, все пакеты отправляются через каждый интерфейс. Имеет ограниченное применение, но обеспечивает значительную отказоустойчивость.

mode=4 (802.3ad)
Особый режим объединения. Для него требуется специально настраивать коммутатор, к которому подключен объединенный интерфейс. Реализует стандарты объединения каналов IEEE и обеспечивает как увеличение пропускной способности, так и отказоустойчивость.

mode=5 (balance-tlb)
Распределение нагрузки при передаче. Входящий трафик обрабатывается в обычном режиме, а при передаче интерфейс определяется на основе данных о загруженности.

mode=6 (balance-alb)
Адаптивное распределение нагрузки. Аналогично предыдущему режиму, но с возможностью балансировать также входящую нагрузку.
```

Пример конфига объединения интерфейсов eth0 и eth1 с балансировкой нагрузки:

```
$ sudo nano /etc/network/interfaces
# The primary network interface
auto bond0
iface bond0 inet static
    address 192.168.1.150
    netmask 255.255.255.0    
    gateway 192.168.1.1
    dns-nameservers 192.168.1.1 8.8.8.8
    dns-search domain.local
        slaves eth0 eth1
        bond_mode 0
        bond-miimon 100
        bond_downdelay 200
        bound_updelay 200
```

5. 
- Сколько хостов в 29й подсети? Хостов 6, ip-адресов 8, включая бродкаст и адрес сети.
- Из /24 сети можно нарезать 32 сети с маской /29
- 10.10.10.0/29; 10.10.10.8/29; 10.10.10.64/29

6. Я бы выбрал подсеть 100.64.0.0/26
7. 
Linux:
`~$ arp -n` - вывод таблицы arp
`ip -s -s neigh flush all` - очистка всего arp кэша

Windows:
`arp -a` - вывод таблицы arp
`arp -d *` - очистка всего arp кэша
