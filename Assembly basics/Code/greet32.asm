;
;  Mario Enriquez A00909441
;  COMP 7615
;  Function to greet in 32 bits
;

%assign SYS_EXIT 	1					;Constant containing exit flag value
%assign WRITE			4					;Constant containing write flag value
%assign STDOUT		1					;Constant containing standard output flag value
%assign ENDL			0x0a			;Constant containing break line flag value

; --------------------------
; data segment
; --------------------------

SECTION .data								;Section that includes our variables

	msg: db "hello"						;Variable containing the message to print
			 db ENDL							;break line
			 db ENDL							;break line
			 db "world!", ENDL		;end of the mesage
	len: equ $-msg						;variable containing the length of our message

SECTION .text								;Contains our main function
	global main								;Declaration of main function

main:												;Main function start
	mov edx, len							;moves to the edx registry the length of the message
	mov ecx, msg							;moves to ecx the message
	mov ebx, STDOUT						;sets ebx to standard output
	mov eax, WRITE						;sets eax registry to write
	int 0x80									;executes writing to standard output and displays message

	mov eax, SYS_EXIT					;set the flag to exit in eax
  mov ebx,0									;sets the exit
	int 0x80									;Executes and finishes
