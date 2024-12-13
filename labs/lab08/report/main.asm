%include 'in_out.asm'

SECTION .data
    msg_function db "Функция: f(x) = 10x - 5", 0
    msg_result db "Результат: ", 0

SECTION .text
    global _start

_start:
    ; Извлечение количества аргументов
    pop ecx
    pop edx

    ; Уменьшаем количество аргументов на 1 (без имени программы)
    sub ecx, 1

    ; Вывод функции
    mov eax, msg_function
    call sprintLF

    ; Переменная для хранения результата
    mov esi, 0

next:
    cmp ecx, 0 ; Проверка оставшихся аргументов
    jz end_loop ; Переход к завершению, если аргументов больше нет

    pop eax ; Извлекаем следующий аргумент
    call atoi ; Преобразуем в число

    ; Вычисление f(x) = 10x - 5
    mov ebx, 10
    mul ebx ; Умножаем eax на 10
    sub eax, 5 ; Вычитаем 5
    add esi, eax ; Добавляем к сумме

    loop next ; Переход к следующему аргументу

end_loop:
    ; Вывод сообщения о результате
    mov eax, msg_result
    call sprint

    ; Вывод результата
    mov eax, esi
    call iprintLF

    ; Завершение программы
    call quit

