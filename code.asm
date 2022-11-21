segment .data
  lf    equ 0xA ; dorp line
  null  equ 0xD ; null

  exit    equ 0x1 ; call exit prog
  read    equ 0x3 ; read operation
  write   equ 0x4 ; write operation
  
  return  equ 0x0 ; return sucessffuly
  stdin   equ 0x0 ; standard input
  stdout   equ 0x1 ; standard output

  go equ 0x80 ; seed info to SO 

section .data
  input_name db "Take your name: "
  input_name_len equ $ - input_name

  hello db "Hello, "
  hello_len equ $ - hello

section .bss
  name resb 1

section .text

global _start

_start:
  mov eax, write
  mov ebx, stdout
  mov ecx, input_name
  mov edx, input_name_len
  int go

  mov eax, read
  mov ebx, stdin
  mov ecx, name
  mov edx, 0xE
  int go

  mov eax, write
  mov ebx, stdout
  mov ecx, hello
  mov edx, hello_len
  int go

  mov eax, write
  mov ebx, stdout
  mov ecx, name
  mov edx, 0xE
  int go

_exit:
  mov eax, exit
  mov ebx, return
  int go
