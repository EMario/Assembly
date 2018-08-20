;;; Excercise 3 task 3
;;;
;;; Assemble, link and run as follows:
;;; nasm -f elf32 -d ELF_TYPE asm_io.asm (do this only once)
;;; nasm -f elf32 -d ELF_TYPE task3.asm
;;; gcc -o task3 -m32 driver.c task3.o asm_io.o
;;; ./task3
;;;

%include "asm_io.inc"
%assign SYS_EXIT 0

SECTION .data
	my_table dd 1, 2, 3, 4, 5

SECTION .text

global asm_main

asm_main:

	mov edi, my_table		;move address to ebx
	mov [edi], dword 123		;move 123 to where edi is pointing
	mov [edi+4], dword 456		;move 456 to where edi+4 is pointing
	mov [edi+8], dword 789		;move 789 to where edi+8 is pointing

	mov  eax, dword [my_table] ;move the contents of the first registry of my_table to eax
	mov  esi, my_table  ;move ponter esi to my_table
	call print_int 			;print what is in eax
	call print_nl

	mov  eax, dword [esi+4] ;move the contents of esi+4 to eax
	call print_int 			;print what is in eax
	call print_nl

	mov  eax, dword [esi+8] ;move the contents of esi+8 to eax
	call print_int 			;print what is in eax
	call print_nl

	mov eax, 0		; exit code normal
	ret
