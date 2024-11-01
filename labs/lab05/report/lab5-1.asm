SECTION .data
 

 msg: 		DB 'Введите строку:',10 
 msgLen: 	EQU $-msg
 
 
 
 SECTION .bss
 
 buf1: RESB 80 

 
  ;-------------------
 SECTION .text
 GLOBAL _start
 _start:

 ;------------ Cистемный вызов `write`
 ; После вызова инструкции 'int 80h' на экран будет
 ; выведено сообщение из переменной 'msg' длиной 'msgLen'
 
	 mov eax,4
	 mov ebx,1
	 mov ecx,msg
	 mov edx,msgLen
	 int 80h
 
 ;------------ системный вызов `read`---------------------
; После вызова инструкции 'int 80h' программа будет ожидать ввода
 ; строки, которая будет записана в переменную 'buf1' размером 80 байт
 
	 mov eax, 3
	 mov ebx, 0
	 mov ecx, buf1
	 mov edx, 80
	 int 80h

 
 ;------------ Системный вызов `exit`---------------------
; После вызова инструкции 'int 80h' программа завершит работу

	 mov eax,1
	 mov ebx,0
	 int 80h
