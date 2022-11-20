nasm -f elf64 code.asm -o app.o 
ld -s -o app app.o
rm *.o
./app
rm app
