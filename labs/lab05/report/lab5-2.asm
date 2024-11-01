%include 'in_out.asm'

 SECTION .data
  msg: DB 'Введите строку: ',0h ; сообщение
  
 SECTION .bss
 
 buf1: RESB 80
 
 SECTION .text
  GLOBAL _start
   _start:
 	mov eax, msg 	        ; запись адреса выводимого сообщения в `EAX`
        call sprint 		; вызов подпрограммы печати сообщения
 	mov ecx, buf1 		; запись адреса переменной в `EAX`
	mov  edx, 80
	
	
  	call sread
 	call quit

