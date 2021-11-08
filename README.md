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

№ ДЗ №4

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

