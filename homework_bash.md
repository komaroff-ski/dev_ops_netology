# Домашнее задание к занятию "4.1. Командная оболочка Bash: Практические навыки"

## Обязательная задача 1

Есть скрипт:
```bash
a=1
b=2
c=a+b
d=$a+$b
e=$(($a+$b))
```

Какие значения переменным c,d,e будут присвоены? Почему?

| Переменная  | Значение | Обоснование |
| ------------- | ------------- | ------------- |
| `c`  | a+b  | Т.к. мы не указали что a и b это переменные, bash посчилал это строкой |
| `d`  | 1+2  | Мы сложили значения двух переменных, но bash определил эту операцию как сложение строк т.к. переменные не были явно определены как числовые |
| `e`  | 3  | Мы указали bash что это арифметическая операция. |


## Обязательная задача 2
На нашем локальном сервере упал сервис и мы написали скрипт, который постоянно проверяет его доступность, записывая дату проверок до тех пор, пока сервис не станет доступным (после чего скрипт должен завершиться). В скрипте допущена ошибка, из-за которой выполнение не может завершиться, при этом место на Жёстком Диске постоянно уменьшается. Что необходимо сделать, чтобы его исправить:
```bash
while ((1==1)
do
	curl https://localhost:4757
	if (($? != 0))
	then
		date >> curl.log
	fi
done
```

### Ваш скрипт:
```
#!/bin/bash

mfilesize=50000
while ((1==1))
do
    curl https://localhost:4757
        if (($? != 0))
        then
          if [ $(wc -c < curl.log) -gt $mfilesize ]
            then
              echo " "> curl.log
            fi
          date >> curl.log
        else
              break
        fi
done
```

## Обязательная задача 3
Необходимо написать скрипт, который проверяет доступность трёх IP: `192.168.0.1`, `173.194.222.113`, `87.250.250.242` по `80` порту и записывает результат в файл `log`. Проверять доступность необходимо пять раз для каждого узла.

### Ваш скрипт:
```
#!/bin/bash

logfile="available.log"
ip_address=("192.168.0.1" "173.194.222.113" "87.250.250.242")

for i in {0..4}
do
  for ip in ${ip_address[@]}
    do
        nc -z $ip 80
        if (($? == 0))
            then
              echo `date` $ip OK >> $logfile
            else
              echo `date` $ip ERROR >> $logfile
        fi
    done
done
```

## Обязательная задача 4
Необходимо дописать скрипт из предыдущего задания так, чтобы он выполнялся до тех пор, пока один из узлов не окажется недоступным. Если любой из узлов недоступен - IP этого узла пишется в файл error, скрипт прерывается.

### Ваш скрипт:
```
#!/bin/bash

logfile="available.log"
ip_address=("192.168.0.1" "173.194.222.113" "87.250.250.242")

for i in {0..4}
do
  for ip in ${ip_address[@]}
    do
        nc -z $ip 80
        if (($? == 0))
            then
              echo `date` $ip OK >> $logfile
            else
              echo $ip > error
              exit 0
        fi
    done
done
```

## Дополнительное задание (со звездочкой*) -  необязательно к выполнению

Мы хотим, чтобы у нас были красивые сообщения для коммитов в репозиторий. Для этого нужно написать локальный хук для git, который будет проверять, что сообщение в коммите содержит код текущего задания в квадратных скобках и количество символов в сообщении не превышает 30. Пример сообщения: \[04-script-01-bash\] сломал хук.

### Ваш скрипт:
```bash
???
```
