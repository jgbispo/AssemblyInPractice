segment .data
  lf    equ 0xA ; dorp line
  null  equ 0xD ; null

  exit    equ 0x1 ; call exit prog
  read    equ 0x3 ; read operation
  write   equ 0x4 ; write operation
  
  return  equ 0x0 ; return sucessffuly
  stdin   equ 0x0 ; standard input
  stout   equ 0x1 ; standard output

  go equ 0x80

section .data
  hello db "Hello, world!", lf, null
  hello_len equ $ - hello

section .text

global _start

_start:
  mov eax, write
  mov ebx, stout
  mov ecx, hello
  mov edx, hello_len
  int go

_exit:
  mov eax, exit
  mov ebx, return
  int go
