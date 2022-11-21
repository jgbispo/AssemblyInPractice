NAME = convert

all: $(NAME).o
	ld -s -o ./build/$(NAME) ./build/$(NAME).o
	rm ./build/$(NAME).o

%.o: %.asm
	nasm -f elf64 $< -o ./build/$(NAME).o
	nasm -f win64 $< -o ./build/$(NAME).exe
