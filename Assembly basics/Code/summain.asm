%include "asm_io.inc" ;Includes the functions print_int and println

SECTION .data         ;Section that includes our variables

  a dd 10             ;First value to add
  b dd 20             ;Second value to add
  c dd 30             ;Third value to add
  result dd 0         ;Contains the result

SECTION .text         ;Contains our main function
	global summain      ;main function

summain:
  mov eax, [a]        ;Moves first value to our eax registry
  add eax, [b]        ;Adds Second value
  add eax, [c]        ;Adds Third value
  mov [result], eax   ;Moves result from registry to result

  mov eax, [result]   ; moves result from variable to eax
  call print_int      ; prints result
  call print_nl       ; prints break line
  mov ebx,0

ret                   ; returns
