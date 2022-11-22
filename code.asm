; include library
%include "library.inc.asm"

section .data
  text db "Hello, World!", lf
  text_size equ $ - text

section .text

global _start

_start:
  mov eax, sys_write
  mov ebx, stdout
  mov ecx, text
  mov edx, text_size
  int sys_go

_end:
  mov eax, sys_exit
  mov ebx, ret_exit
  int sys_go
