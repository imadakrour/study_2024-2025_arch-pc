;-------------------------------------
; Программа вычисления функции f(x)
; Вариант 3: f(x) = (2 + x)^2
;-------------------------------------
%include 'in_out.asm'
SECTION .data
expr: DB 'f(x) = (2 + x)^2', 0
prompt1: DB 'Введите x1: ', 0
prompt2: DB 'Введите x2: ', 0
result1: DB 'Результат f(x1): ', 0
result2: DB 'Результат f(x2): ', 0
SECTION .bss
buf: RESB 80
SECTION .text
GLOBAL _start
_start:
    ; Вывод выражения
    mov eax, expr
    call sprintLF

    ; Запрос ввода x1
    mov eax, prompt1
    call sprintLF
    mov ecx, buf
    mov edx, 80
    call sread             ; Ввод значения x1
    mov eax, buf
    call atoi              ; Преобразование ASCII в число (x1 в eax)

    ; Вычисление f(x1) = (2 + x1)^2
    add eax, 2             ; eax = 2 + x1
    mov ebx, eax           ; Сохранение (2 + x1) в ebx
    mul ebx                ; eax = eax * ebx = (2 + x1)^2
    mov edi, eax           ; Сохранение результата f(x1) в edi

    ; Вывод результата f(x1)
    mov eax, result1
    call sprint
    mov eax, edi
    call iprintLF

    ; Запрос ввода x2
    mov eax, prompt2
    call sprintLF
    mov ecx, buf
    mov edx, 80
    call sread             ; Ввод значения x2
    mov eax, buf
    call atoi              ; Преобразование ASCII в число (x2 в eax)

    ; Вычисление f(x2) = (2 + x2)^2
    add eax, 2             ; eax = 2 + x2
    mov ebx, eax           ; Сохранение (2 + x2) в ebx
    mul ebx                ; eax = eax * ebx = (2 + x2)^2
    mov edi, eax           ; Сохранение результата f(x2) в edi

    ; Вывод результата f(x2)
    mov eax, result2
    call sprint
    mov eax, edi
    call iprintLF

    ; Завершение программы
    call quit

