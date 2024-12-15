---
## Front matter
title: "О. Лабораторная работа №9. Понятие подпрограммы.
Отладчик GDB"
subtitle: "Архитектура компьютеров"
author: "Акрур Имад НКАбд-06-24"

## Generic otions
lang: ru-RU
toc-title: "Содержание"

## Bibliography
bibliography: bib/cite.bib
csl: pandoc/csl/gost-r-7-0-5-2008-numeric.csl

## Pdf output format
toc: true # Table of contents
toc-depth: 2
lof: true # List of figures
lot: true # List of tables
fontsize: 12pt
linestretch: 1.5
papersize: a4
documentclass: scrreprt
## I18n polyglossia
polyglossia-lang:
  name: russian
  options:
	- spelling=modern
	- babelshorthands=true
polyglossia-otherlangs:
  name: english
## I18n babel
babel-lang: russian
babel-otherlangs: english
## Fonts
mainfont: PT Serif
romanfont: PT Serif
sansfont: PT Sans
monofont: PT Mono
mainfontoptions: Ligatures=TeX
romanfontoptions: Ligatures=TeX
sansfontoptions: Ligatures=TeX,Scale=MatchLowercase
monofontoptions: Scale=MatchLowercase,Scale=0.9
## Biblatex
biblatex: true
biblio-style: "gost-numeric"
biblatexoptions:
  - parentracker=true
  - backend=biber
  - hyperref=auto
  - language=auto
  - autolang=other*
  - citestyle=gost-numeric
## Pandoc-crossref LaTeX customization
figureTitle: "Рис."
tableTitle: "Таблица"
listingTitle: "Листинг"
lofTitle: "Список иллюстраций"
lotTitle: "Список таблиц"
lolTitle: "Листинги"
## Misc options
indent: true
header-includes:
  - \usepackage{indentfirst}
  - \usepackage{float} # keep figures where there are in the text
  - \floatplacement{figure}{H} # keep figures where there are in the text
---

# Цель работы


Целью работы является приобретение навыков написания программ с использованием подпрограмм.
Знакомство с методами отладки при помощи GDB и его основными возможностями.

# Описание результатов выполнения лабораторной работы:
## Выполнение лабораторной работы

Я создал каталог для выполнения лабораторной работы № 9 и перешел в него. 
Затем я создал файл lab9-1.asm.

В качестве примера рассмотрим программу вычисления арифметического 
выражения $f(x) = 2x+7$ с помощью подпрограммы calcul. 
В данном примере $x$ вводится с клавиатуры, а само выражение вычисляется 
в подпрограмме.(рис. [-@fig:001]) (рис. [-@fig:002])

![Программа в файле lab9-1.asm](/home/imadakrour/Pictures/lab09/1.png){ #fig:001 width=70%, height=70% }

![Запуск программы lab9-1.asm](/home/imadakrour/Pictures/lab09/2.png){ #fig:002 width=70%, height=70% }

Изменил текст программы, добавив подпрограмму subcalcul в подпрограмму calcul, 
для вычисления выражения $f(g(x))$, где $x$ вводится с клавиатуры, 
$f(x) = 2x + 7, g(x) = 3x − 1$. (рис. [-@fig:003]) (рис. [-@fig:004])

![Программа в файле lab9-1.asm](/home/imadakrour/Pictures/lab09/3.png){ #fig:003 width=70%, height=70% }

![Запуск программы lab9-1.asm](/home/imadakrour/Pictures/lab09/4.png){ #fig:004 width=70%, height=70% }

Создал файл lab9-2.asm с текстом программы из Листинга 9.2. 
(Программа печати сообщения Hello world!). (рис. [-@fig:005])

![Программа в файле lab9-2.asm](/home/imadakrour/Pictures/lab09/5.png){ #fig:005 width=70%, height=70% }

Получил исполняемый файл и добавил отладочную информацию с помощью ключа '-g' для работы с GDB.

Загрузил исполняемый файл в отладчик GDB и 
проверил работу программы, запустив ее с помощью команды 'run' 
(сокращенно 'r'). (рис. [-@fig:006])

![Запуск программы lab9-2.asm в отладчике](/home/imadakrour/Pictures/lab09/6.png){ #fig:006 width=70%, height=70% }

Для более подробного анализа программы, установил точку остановки на метке 'start',
с которой начинается выполнение любой ассемблерной программы, 
и запустил ее. Затем просмотрел дизассемблированный 
код программы.(рис. [-@fig:007]) (рис. [-@fig:008])

![Дизассемблированный код](/home/imadakrour/Pictures/lab09/7.png){ #fig:007 width=70%, height=70% }

![Дизассемблированный код в режиме интел](/home/imadakrour/Pictures/lab09/8.png){ #fig:008 width=70%, height=70% }

Для проверки точки остановки по имени метки '_start', использовал команду 
'info breakpoints' (сокращенно 'i b'). Затем установил еще одну точку остановки 
по адресу инструкции, 
определив адрес предпоследней инструкции 'mov ebx, 0x0'. (рис. [-@fig:009])

![Точка остановки](/home/imadakrour/Pictures/lab09/9.png){ #fig:009 width=70%, height=70% }

В отладчике GDB можно просматривать содержимое ячеек памяти и регистров, 
а также изменять значения регистров и переменных. Выполнил 5 инструкций с 
помощью команды 'stepi' (сокращенно 'si') и отследил изменение значений 
регистров. (рис. [-@fig:010]) (рис. [-@fig:011])

![Изменение регистров](/home/imadakrour/Pictures/lab09/10.png){ #fig:010 width=70%, height=70% }

![Изменение регистров](/home/imadakrour/Pictures/lab09/11.png){ #fig:011 width=70%, height=70% }

Просмотрел значение переменной msg1 по имени и получил нужные данные.

Просмотрел значение переменной msg1 по имени и получил нужные данные.

Для изменения значения регистра или ячейки памяти использовал команду set, 
указав имя регистра или адрес в качестве аргумента. 
Изменил первый символ переменной msg1. (рис. [-@fig:012])

![Изменение значения переменной](/home/imadakrour/Pictures/lab09/12.png){ #fig:012 width=70%, height=70% }

Для изменения значения регистра или ячейки памяти использовал команду set, 
указав имя регистра или адрес в качестве аргумента. 
Изменил первый символ переменной msg1.(рис. [-@fig:013])

![Вывод значения регистра](/home/imadakrour/Pictures/lab09/13.png){ #fig:013 width=70%, height=70% }

С помощью команды set изменил значение регистра ebx на нужное значение. (рис. [-@fig:014])

![Вывод значения регистра](/home/imadakrour/Pictures/lab09/14.png){ #fig:014 width=70%, height=70% }

Скопировал файл lab8-2.asm, созданный во время выполнения лабораторной работы №8, 
который содержит программу для вывода аргументов командной строки. 
Создал исполняемый файл из скопированного файла.

Для загрузки программы с аргументами в gdb использовал ключ --args 
и загрузил исполняемый файл в отладчик с указанными аргументами.

Установил точку останова перед первой инструкцией программы и запустил ее.

Адрес вершины стека, содержащий количество аргументов командной строки 
(включая имя программы), хранится в регистре esp. По этому адресу находится 
число, указывающее количество аргументов. В данном случае видно, 
что количество аргументов равно 5, включая имя программы lab9-3 и сами 
аргументы: аргумент1, аргумент2 и 'аргумент 3'.

Просмотрел остальные позиции стека. 
По адресу [esp+4] находится адрес в памяти, где располагается имя программы. 
По адресу [esp+8] хранится адрес первого аргумента, 
по адресу [esp+12] - второго и так далее. (рис. [-@fig:015])

![Вывод значения регистра](/home/imadakrour/Pictures/lab09/15.png){ #fig:015 width=70%, height=70% }

Шаг изменения адреса равен 4, так как каждый следующий адрес на стеке находится на расстоянии 4 байт от предыдущего ([esp+4], [esp+8], [esp+12]).

# Описание результатов выполнения заданий для самостоятельной работы:

## Oписание выполняемого задания
Преобразовал программу из лабораторной работы №8 (Задание №1 для
самостоятельной работы), реализовав вычисление значения функции f(x)
как подпрограмму. (рис. [-@fig:016]) (рис. [-@fig:017])

![Программа в файле prog-1.asm](/home/imadakrour/Pictures/lab09/16.png){ #fig:016 width=70%, height=70% }

![Запуск программы prog-1.asm](/home/imadakrour/Pictures/lab09/17.png){ #fig:017 width=70%, height=70% }

В листинге приведена программа вычисления выражения $(3+2)*4+5$. 
При запуске данная программа дает неверный результат. Проверил это, 
анализируя изменения значений регистров с помощью отладчика GDB. 

Определил ошибку - перепутан порядок аргументов у инструкции add. 
Также обнаружил, что по окончании работы в edi отправляется ebx вместо eax.(рис. [-@fig:018])

![Код с ошибкой](/home/imadakrour/Pictures/lab09/18.png){ #fig:018 width=70%, height=70% }

![Отладка](/home/imadakrour/Pictures/lab09/19.png){ #fig:019 width=70%, height=70% }

Отмечу, что перепутан порядок аргументов у инструкции add и что по окончании работы в edi 
отправляется ebx вместо eax (рис. [-@fig:019])

Исправленный код программы (рис. [-@fig:020]) (рис. [-@fig:021])

![Код исправлен](/home/imadakrour/Pictures/lab09/20.png){ #fig:020 width=70%, height=70% }

![Проверка работы](/home/imadakrour/Pictures/lab09/21.png){ #fig:021 width=70%, height=70% }

# Выводы

Освоили работy с подпрограммами и отладчиком.
