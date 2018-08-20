;
;  Mario Enriquez A00909441
;  COMP 7615
;  Function to add numbers
;

%include "asm_io.inc"     ;calls print_int and print_nl

%assign SYS_EXIT 	1       ;Global constant that has exit
%assign ENDL			0x0a    ;Global constant that has a break line

SECTION .data								;Section that includes our variables

  a dd 0                  ;First value to store
  b dd 0                  ;Second value to store
  c dd 0                  ;Third value to store
  num dd 0                ;Stores the result

SECTION .text								;Contains our main function
  global main								;Declaration of main function

main:												;Main function start
  mov ebx, '5'              ;sets values and calls sumup
  mov ecx, '5'
  mov edx, '1'
  call sumup

  mov ebx, '5'              ;sets values and calls sumup
  mov ecx, '4'
  mov edx, '1'
  call sumup

  mov ebx, '3'              ;sets values and calls sumup
  mov ecx, '1'
  mov edx, '1'
  call sumup

  mov ebx, '9'              ;sets values and calls sumup
  mov ecx, '9'
  mov edx, '9'
  call sumup

  mov ebx, '1'              ;sets values and calls sumup
  mov ecx, '2'
  mov edx, '3'
  call sumup

  mov eax, SYS_EXIT					;set the flag to exit in eax
  mov ebx,0									;sets the exit
	int 0x80									;Executes and finishes

sumup:
    sub ebx, '0'            ;converts ebx to decimal
    sub ecx, '0'            ;converts ecx to decimal
    sub edx, '0'            ;converts edx to decimal

    mov [a], ebx            ;moves ebx value to a variable
    mov [b], ecx            ;moves ecx value to a variable
    mov [c], edx            ;moves edx value to a variable
    mov eax, [a]            ;moves a to eax
    add eax, [b]            ;add b to eax
    add eax, [c]            ;add c to eax
    mov [num], eax          ;moves eax to num variable

    mov eax,[num]           ;moves num to eax registry
    call print_int          ;prints eax
    call print_nl           ;prints break line

    ret                     ;return
