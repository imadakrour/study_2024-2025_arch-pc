%include 'in_out.asm'

SECTION .data
msg1 db 'Введите B: ', 0h
msg2 db "Наибольшее число: ", 0h

A dd '20'
C dd '50'

SECTION .bss
max resb 10
B resb 10

SECTION .text
GLOBAL _start

_start:
    ; ---------- Вывод сообщения 'Введите B: '
    mov eax, msg1
    call sprint

    ; ---------- Ввод 'B'
    mov ecx
    mov edx, 10
    call sread

    ; ---------- Преобразование 'B' из символа в число
    mov eax, B
    call atoi
    mov [B], eax ; Запись преобразованного числа в 'B'

    ; ---------- Записываем 'A' в переменную 'max'
    mov ecx, [A] ; 'ecx = A'
    mov [max], ecx ; 'max = A'

    ; ---------- Сравниваем 'A' и 'С'
    cmp ecx, [C]
    jg check_B ; Если 'A > C', перейти на 'check_B'
    mov ecx, [C] ; Иначе 'ecx = C'
    mov [max], ecx ; 'max = C'

check_B:
    ; ---------- Преобразование 'max' из символа в число
    mov eax, max
    call atoi
    mov [max], eax

    ; ---------- Сравниваем 'max' и 'B'
    mov ecx, [max]
    cmp ecx, [B]
    jg fin ; Если 'max > B', перейти на 'fin'
    mov ecx, [B] ; Иначе 'ecx = B'
    mov [max], ecx

fin:
    ; ---------- Вывод результата
    mov eax, msg2
    call sprint ; Вывод сообщения 'Наибольшее число: '
    mov eax, [max]
    call iprintLF ; Вывод 'max(A, B, C)'
    call quit ; Завершение программы

