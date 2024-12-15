%include 'in_out.asm'

SECTION .data
msg:    DB 'Введите x: ', 0
result: DB 'f(g(x))=', 0

SECTION .bss
x:      RESB 80
res:    RESB 80

SECTION .text
GLOBAL _start

_start:
    ;-----------------------------------------
    ; Основная программа
    ;-----------------------------------------
    mov eax, msg
    call sprint          ; Вывод сообщения "Введите x:"

    mov ecx, x
    mov edx, 80
    call sread           ; Чтение значения x

    mov eax, x
    call atoi            ; Преобразование строки в число

    call _calcul         ; Вызов подпрограммы _calcul

    mov eax, result
    call sprint          ; Вывод результата
    mov eax, [res]
    call iprintLF        ; Печать результата с переносом строки

    call quit            ; Завершение программы

_calcul:
    push eax          ; 
    call _subcalcul   ; 
    mov ebx, eax      ; 
    pop eax           ; 
    mul ebx           ; 
    add eax, 7        ; 
    mov [res], eax    ; 
    ret


_subcalcul:
    mov ebx, 3        ; 
    mul ebx
    sub eax, 1        ;
    ret


