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
  x dd 20
  y dd 20

  x_y db "X greater than Y", lf, null
  x_len equ $ - x_y

  y_x db "Y greater than X", lf, null
  y_len equ $ - y_x

section .text

global _start

_start:
  mov eax, dword[x]
  mov ebx, dword[y]
  cmp eax, ebx
  jge _xGreaterThanY
  mov ecx, y_x
  mov edx, y_len
  jmp _end
  
_xGreaterThanY:
  mov ecx, x_y
  mov edx, x_len

_end:
  mov eax, write
  mov ebx, stdout
  int go

  mov eax, exit
  mov ebx, return
  int go
