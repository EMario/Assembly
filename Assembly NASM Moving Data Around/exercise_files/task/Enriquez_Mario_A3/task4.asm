;;; Excercise 3 task 4
;;;
;;; Assemble, link and run as follows:
;;; nasm -f elf32 -d ELF_TYPE asm_io.asm (do this only once)
;;; nasm -f elf32 -d ELF_TYPE task4.asm
;;; gcc -o task4 -m32 driver.c task4.o asm_io.o
;;; ./task4
;;;

%include "asm_io.inc"
%assign SYS_EXIT 0
%assign LOOPSIZE 5

;; -------------------------
;; data segment
;; -------------------------
section .data

		prompt db    "Enter a number: ", 0       ; don't forget nul terminator
		summsg db    "Result of the addition is: ", 0       ; don't forget nul terminator
		mulmsg db    "Result of the multiplication is: ", 0       ; don't forget nul terminator
		avemsg db    "Average of the addition is: ", 0       ; don't forget nul terminator
		result dd 0
		mytable times LOOPSIZE dd 0

;; -------------------------
;; code area
;; -------------------------
section .text

		global asm_main

asm_main:

		mov eax, 1  								;start with 1 in eax
		mov ecx, LOOPSIZE  					;get ready to loop LOOPSIZE times
		mov edi, mytable						;move edi pointer to mytable

		for: mov [edi], dword eax		;loop start move contents of eax into the place edi is pointing
			add eax, 1								;add 1 to eax
			add edi, 4								;move pointer
			loop for									;end of loop

		mov eax, 0 									;start with 0 in eax
		mov ecx, LOOPSIZE  					;get ready to loop LOOPSIZE times
		mov esi, mytable						;move esi pointer to mytable

		for2: add eax, dword [esi]	;loop2 start add to eax the contents if the place esi is pointing
			add esi, 4								;move pointer
			loop for2									;end of loop2

		call print_int  						;and print value
		call print_nl  							;call the function that prints a new blank line

		mov eax, 1 									;start with 1 in eax
		mov ecx, LOOPSIZE  					;get ready to loop LOOPSIZE times
		mov esi, mytable						;move esi pointer to mytable

		for3: mul dword [esi]				;loop2 start multiply to eax the contents if the place esi is pointing
			add esi, 4 								;move pointer
			loop for3									;end of loop3

		call print_int  						;and print value
		call print_nl  							;call the function that prints a new blank line


;; return to C program

		ret
