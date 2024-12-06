%include 'in_out.asm'
section .data
    msg_input_x db "Введите x: ", 0h     ; Сообщение для ввода x
    msg_input_a db "Введите a: ", 0h     ; Сообщение для ввода a
    msg_result db "Результат f(x): ", 0h ; Сообщение для результата

section .bss
    x resb 10    ; Переменная x
    a resb 10    ; Переменная a
    res resb 10  ; Результат f(x)

section .text
global _start

_start:
    ; ---------- Ввод x
    mov eax, msg_input_x
    call sprint         ; Вывод сообщения для ввода
    mov ecx, x
    mov edx, 10
    call sread          ; Чтение x
    mov eax, x
    call atoi           ; Преобразование x в число
    mov [x], eax

    ; ---------- Ввод a
    mov eax, msg_input_a
    call sprint         ; Вывод сообщения для ввода
    mov ecx, a
    mov edx, 10
    call sread          ; Чтение a
    mov eax, a
    call atoi           ; Преобразование a в число
    mov [a], eax

    ; ---------- Вычисление f(x)
    mov eax, [x]
    cmp eax, 3          ; Сравнение x с 3
    je equal_x          ; Если x == 3, перейти на equal_x

not_equal_x:
    mov eax, [a]
    add eax, 1          ; Вычисление a + 1
    jmp output_result

equal_x:
    mov eax, [x]
    imul eax, 3         ; Вычисление 3x

output_result:
    mov [res], eax      ; Сохранение результата в res

    ; ---------- Вывод результата
    mov eax, msg_result
    call sprint         ; Вывод сообщения результата
    mov eax, [res]
    call iprintLF       ; Вывод значения f(x)

    ; ---------- Завершение программы
    call quit

