;
;  Mario Enriquez A00909441
;  COMP 7615
;  Function to Display name
;

%assign SYS_EXIT 	1					;Constant containing exit flag value
%assign WRITE			4					;Constant containing write flag value
%assign STDOUT		1					;Constant containing standard output flag value
%assign ENDL			0x0a			;Constant containing break line flag value

; --------------------------
; data segment
; --------------------------

SECTION .data								;Section that includes our variables

  opb: db "<<"              ;variables displayed on the banner
  clb: db ">>"
  spc: db "  "
  shr: db "##"
  ms1: db "COMP  7615"
  ms2: db "Mario Enriquez"
  end: db ENDL
	ln1: equ 10
  ln2: equ 14

  SECTION .text								;Contains our main function
  	global main								;Declaration of main function

  main:												;Main function start
    call topbottom            ;calls function topbottom

    call leftside             ;calls function leftside

    mov edx, 2                ;writes remaining blank spaces
    mov ecx, spc
    mov ebx, STDOUT
    mov eax, WRITE
  	int 0x80

    mov edx, ln1              ;writes COMP 7615
    mov ecx, ms1
    mov ebx, STDOUT
    mov eax, WRITE
    int 0x80

    mov edx, 2                ;writes remaining blank spaces
    mov ecx, spc
    mov ebx, STDOUT
    mov eax, WRITE
  	int 0x80

    call rightside            ;calls function rightside

    call leftside;            ;calls function leftside

    mov edx, ln2              ;writes my name
    mov ecx, ms2
    mov ebx, STDOUT
    mov eax, WRITE
    int 0x80

    call rightside            ;calls function rightside

    call topbottom            ;calls function topbottom

    mov eax, SYS_EXIT					;set the flag to exit in eax
    mov ebx,0									;sets the exit
  	int 0x80									;Executes and finishes

  topbottom:              ;Prints both the top and the bottom of the banner

      mov edx, 2          ;function prints patterns for the banner on the top and the bottom
      mov ecx, opb
      mov ebx, STDOUT
      mov eax, WRITE
    	int 0x80
      mov eax, WRITE
    	int 0x80
      mov eax, WRITE
    	int 0x80
      mov eax, WRITE
    	int 0x80
      mov eax, WRITE
    	int 0x80

      mov edx, 2
      mov ecx, spc
      mov ebx, STDOUT
      mov eax, WRITE
    	int 0x80
      mov eax, WRITE
    	int 0x80
      mov eax, WRITE
    	int 0x80

      mov edx, 2
      mov ecx, shr
      mov ebx, STDOUT
      mov eax, WRITE
    	int 0x80
      mov eax, WRITE
    	int 0x80
      mov eax, WRITE
    	int 0x80
      mov eax, WRITE
    	int 0x80
      mov eax, WRITE
    	int 0x80
      mov eax, WRITE
    	int 0x80
      mov eax, WRITE
    	int 0x80

      mov edx, 2
      mov ecx, spc
      mov ebx, STDOUT
      mov eax, WRITE
    	int 0x80
      mov eax, WRITE
    	int 0x80
      mov eax, WRITE
    	int 0x80

      mov edx, 2
      mov ecx, clb
      mov ebx, STDOUT
      mov eax, WRITE
    	int 0x80
      mov eax, WRITE
    	int 0x80
      mov eax, WRITE
    	int 0x80
      mov eax, WRITE
    	int 0x80
      mov eax, WRITE
    	int 0x80

      mov edx, 1
      mov ecx, end
      mov ebx, STDOUT
      mov eax, WRITE
      int 0x80
    ret                   ;returns

    leftside:             ;function prints patterns for the banner on the middle leftside
      mov edx, 2
      mov ecx, opb
      mov ebx, STDOUT
      mov eax, WRITE
      int 0x80

      mov edx, 2
      mov ecx, spc
      mov ebx, STDOUT
      mov eax, WRITE
    	int 0x80
      mov eax, WRITE
    	int 0x80
      mov eax, WRITE
    	int 0x80
      mov eax, WRITE
    	int 0x80
      mov eax, WRITE
    	int 0x80
      mov eax, WRITE
    	int 0x80
      mov eax, WRITE
    	int 0x80

    ret                       ;returns

    rightside:                ;function prints patterns for the banner on the middle rightside
      mov edx, 2
      mov ecx, spc
      mov ebx, STDOUT
      mov eax, WRITE
      int 0x80
      mov eax, WRITE
      int 0x80
      mov eax, WRITE
      int 0x80
      mov eax, WRITE
      int 0x80;writes COMP 761
      mov eax, WRITE
      int 0x80
      mov eax, WRITE
      int 0x80
      mov eax, WRITE
      int 0x80

      mov edx, 2
      mov ecx, clb
      mov ebx, STDOUT
      mov eax, WRITE
      int 0x80

      mov edx, 1
      mov ecx, end
      mov ebx, STDOUT
      mov eax, WRITE
      int 0x80
    ret                       ;returns
