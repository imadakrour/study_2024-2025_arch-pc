%include 'in_out.asm'

section .data
    msg_min db "Наименьшее число: ", 0h ; Сообщение для вывода результата
    a dd 94                            ; Значение переменной a
    b dd 5                             ; Значение переменной b
    c dd 58                            ; Значение переменной c

section .bss
    min resb 10                        ; Память для результата

section .text
global _start

_start:
    ; ---------- Инициализируем min значением 'a'
    mov eax, [a]
    mov [min], eax

    ; ---------- Сравниваем 'min' с 'b'
    mov eax, [min]
    cmp eax, [b]
    jl check_c         ; Если min < b, перейти на проверку c
    mov eax, [b]
    mov [min], eax

check_c:
    ; ---------- Сравниваем 'min' с 'c'
    mov eax, [min]
    cmp eax, [c]
    jl fin             ; Если min < c, перейти к выводу результата
    mov eax, [c]
    mov [min], eax

fin:
    ; ---------- Выводим результат
    mov eax, msg_min
    call sprint        ; Вывод сообщения
    mov eax, [min]
    call iprintLF      ; Вывод минимального значения

    ; ---------- Завершение программы
    call quit
