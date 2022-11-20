NOME = app

all: $(NOME).o
	ld -s -o $(NOME) $(NOME).o
	rm -rf *.o;

%.o: code.asm
	nasm -f elf64 code.asm -o app.o
