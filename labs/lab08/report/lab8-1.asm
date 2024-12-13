
%include 'in_out.asm'

SECTION .data
    msg1 db 'Введите N: ', 0h 

SECTION .bss
    N resb 10

SECTION .text
global _start
_start:
    ;----- Вывод сообщения 'Введите N: '
    mov eax, msg1
    call sprint

    ;----- Ввод 'N'
    mov ecx, N
    mov edx, 10
    call sread

    ;----- Преобразование 'N' из символа в число
    mov eax, N
    call atoi
    mov [N], eax

    ;------ Организация цикла
    mov ecx, [N] ; Счетчик цикла, `ecx=N`
label:
    push ecx      ; Сохранение значения ecx в стеке
    sub ecx, 1    ; Уменьшение значения ecx на 1
    mov [N], ecx
    mov eax, [N]
    call iprintLF ; Вывод значения `N`
    pop ecx       ; Восстановление значения ecx из стека
    loop label    ; Переход на `label`, если ecx > 0

    call quit

