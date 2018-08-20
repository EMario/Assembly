;
;  Mario Enriquez A00909441
;  COMP 7615
;  Function to greet in 64 bits
;

%assign SYS_EXIT 	1					;Constant containing exit flag value
%assign WRITE		1						;Constant containing write flag value
%assign STDOUT		1					;Constant containing standard output flag value
%assign ENDL		0x0a				;Constant containing break line flag value

; --------------------------
; data segment
; --------------------------

SECTION .data 							;Section that includes our variables

	msg: db "hello"						;Variable containing the message to print
			 db ENDL							;break line
			 db ENDL							;break line
			 db "world!", ENDL		;end of the mesage
	len: equ $-msg						;variable containing the length of our message

	SECTION .text								;Contains our main function
		global main								;Declaration of main function

main:												;Main function start
	mov rdx, len							;moves to the rdx registry the length of the message
	mov rsi, msg							;moves to rsi the message
	mov rdi, STDOUT						;sets ebx to standard output
	mov rax, WRITE						;sets rax registry to write
	syscall										;executes system call and writing to standard output and displays message

	mov rdi, SYS_EXIT					;set the flag to exit in eax
	mov rax, 60								;sets the exit
	syscall										;Executes system call and finishes
