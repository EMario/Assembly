#Makefile for the assignment 2
# Mario Enriquez, Based on C. Orr
#

#
# 32-bit greet assembly program
#
greet32.o: greet32.asm
	nasm -f elf32 greet32.asm -l greet32.lst
greet32: greet32.o
	gcc -o greet32 -m32 greet32.o
	./greet32

#
#  64-bit greet assembly program
#
greet64.o: greet64.asm
	nasm -f elf64 greet64.asm -l greet64.lst
greet64: greet64.o
	gcc -o greet64 greet64.o
	-./greet64

 #
 # name banner assembly program in 32-bits
 #
 name.o: name.asm
	nasm -f elf32 name.asm -l name.lst
 name: name.o
	gcc -o name -m32 name.o
	./name

 #
 # 32-bit adding assembly program
 #
 asm_io.o:
	nasm -f elf32 -d ELF_TYPE asm_io.asm
 addnums.o:asm_io.o  addnums.asm
	nasm -f elf32 -d ELF_TYPE addnums.asm
 addnums: asm_io.o addnums.o
	-gcc -o addnums -m32 addnums.o asm_io.o
	-./addnums

#
# C Driver that invokes a sum operation
#
asm_io.o:
	nasm -f elf32 -d ELF_TYPE asm_io.asm
summain.o: asm_io.o summain.asm
	nasm -f elf32 -d ELF_TYPE summain.asm
sum_drive: asm_io.o summain.o sum_drive.c
	gcc -o sum_drive -m32 sum_drive.c summain.o asm_io.o
	-./sum_drive

#
# make all
#
all: greet32 greet64 name addnums sum_drive

#
# Run everything
#
run:
	./greet32
	-./greet64
	./name
	-./addnums
	-./sum_drive


#
# cleanup
#
clean:
	rm -f *.o
	rm -f *.lst
	rm -f greet32
	rm -f greet64
	rm -f name
	rm -f addnums
	rm -f sum_drive
