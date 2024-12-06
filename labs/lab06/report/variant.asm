;--------------------------------
; Program to calculate variant number
;--------------------------------
%include 'in_out.asm'      ; Include necessary functions for I/O operations

SECTION .data
msg: DB 'Введите № студенческого билета: ', 0  ; Prompt message
rem: DB 'Ваш вариант: ', 0                    ; Result message

SECTION .bss
x: RESB 80            ; Reserve space for user input (up to 80 bytes)

SECTION .text
GLOBAL _start

_start:
    ; ---- Prompt the user for their student ID ----
    mov eax, msg      ; Load the prompt message into EAX
    call sprintLF     ; Display the prompt message

    ; ---- Read the student ID from user input ----
    mov ecx, x        ; Load address of buffer `x` to store input
    mov edx, 80       ; Specify max number of characters to read
    call sread        ; Read user input into buffer `x`

    ; ---- Convert input from ASCII to integer ----
    mov eax, x        ; Load address of `x` (input buffer)
    call atoi         ; Convert ASCII input in `x` to integer, result in EAX

    ; ---- Compute the variant number ----
    xor edx, edx      ; Clear EDX for division operation
    mov ebx, 20       ; Set divisor to 20
    div ebx           ; EAX = EAX / 20, EDX = remainder (student_id mod 20)
    inc edx           ; Increment EDX to get (student_id mod 20) + 1

    ; ---- Display the result ----
    mov eax, rem      ; Load result message into EAX
    call sprint       ; Display the result message
    mov eax, edx      ; Move the variant number into EAX for printing
    call iprintLF     ; Print the variant number with a newline

    ; ---- Exit the program ----
    call quit         ; Terminate the program

