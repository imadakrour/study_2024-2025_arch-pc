%include 'in_out.asm'

SECTION .bss
buf1:
    RESB 80

SECTION .text
GLOBAL _start

_start:
    mov eax, 6
    mov ebx, 4	
    add eax, ebx         ; Add EAX and EBX, result in EAX
    mov [buf1], eax      ; Store result in buf1
    mov eax, buf1        ; Load address of buf1 into EAX
    call sprintLF        ; Call sprintLF function to print
    call quit            ; Exit program
