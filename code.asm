;; include library
%include "library.inc.asm"

section .text

global _start

_start:
  lea esi, [buffer] ; Load Effective address
  add esi, 0x9
  mov byte[esi], 0xA
  
  dec esi
  mov dl, 0x19 ;; E
  add dl, "0"
  mov [esi], dl

  dec esi
  mov dl, 0x18 ;; H
  add dl, "0"
  mov [esi], dl
 
  call print

_end:
  mov eax, sys_exit
  mov ebx, ret_exit
  int sys_go
