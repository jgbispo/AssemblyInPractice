%include "library.inc.asm"


section .data
  v1 dw "105", lf, null

section .text

global _start

_start: 
  call convert_value
  call show_value

  mov eax, sys_exit
  mov ebx, ret_exit
  int sys_go

convert_value:
  lea esi, [v1]
  mov ecx, 0x3
  call string_to_int
  add eax, 0x2
  ret

show_value:
  call int_to_string
  call print
  ret

string_to_int:
  xor ebx, ebx

.next_char_string:
  movzx eax, byte[esi]
  inc esi
  sub al, '0'
  imul ebx, 0xA
  add ebx, eax
  loop .next_char_string
  mov eax, ebx
  ret

int_to_string:
  lea esi, [buffer]
  add esi, 0x9
  mov byte[esi], 0xA
  mov ebx, 0xA

.next_char_int:
  xor edx, edx
  div ebx
  add dl, '0'
  dec esi
  mov [esi], dl
  test eax, eax
  jnz .next_char_int
  ret






