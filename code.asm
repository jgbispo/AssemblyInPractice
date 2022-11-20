segment .data
  lf equ 0xA ; line feed

section .data
  msg db "Hello, world!", lf
  msg_len equ $ - msg

section .text

global _start

_start:
  mov eax, 0x4
  mov ebx, 0x1
  mov ecx, msg
  mov edx, msg_len
  int 0x80

_exit:
  mov eax, 0x1
  mov ebx, 0x0
  int 0x80
