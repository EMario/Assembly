#Makefile for the assignment 3
# Mario Enriquez, Based on C. Orr
#

#
# asm_io
#
asm_io.o:
	nasm -f elf32 -d ELF_TYPE asm_io.asm

#
# task 1
#

task1:
	nasm -f elf32 -d ELF_TYPE task1.asm -l task1.lst

#
# task 2
#
task2.o:asm_io.o  task2.asm
	nasm -f elf32 -d ELF_TYPE task2.asm
task2: asm_io.o task2.o driver.c
	gcc -o task2 -m32 driver.c task2.o asm_io.o
	-./task2

#
# task 3
#
task3.o:asm_io.o  task3.asm
	nasm -f elf32 -d ELF_TYPE task3.asm
task3: asm_io.o task3.o driver.c
	gcc -o task3 -m32 driver.c task3.o asm_io.o
	-./task3

#
# task 4
#
task4.o:asm_io.o  task4.asm
	nasm -f elf32 -d ELF_TYPE task4.asm
task4: asm_io.o task4.o driver.c
	gcc -o task4 -m32 driver.c task4.o asm_io.o
	-./task4

#
# make all
#
all: task1 task2 task3 task4

#
# Run everything
#
run:
	-./task2
	-./task3
	-./task4

#
# cleanup
#
clean:
	rm -f *.o
	rm -f *.lst
	rm -f task1
	rm -f task2
	rm -f task3
	rm -f task4
