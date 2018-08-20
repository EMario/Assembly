%include "asm_io.inc"
SECTION .data
        result dd 0;

SECTION .text

global mult_asm

mult_asm:

  enter 0,0             ;equiv to PUSH EBP; MOV EBP, ESP
  pusha                 ;stores all 8 general registers

  mov eax,[ebp + 8]     ;this gets number 3
  imul eax, [ebp + 12]  ;this gets number -4, and multiplies
  mov [result], eax     ;move 32-bits of the whole product to result
  call print_int
  call print_nl

  popa                  ;restores all 8 general registries
  mov eax, [result]     ;
  leave
  ret
