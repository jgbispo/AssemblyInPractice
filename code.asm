; include library
%include "library.inc.asm"

section .data
  title: db lf, "+=======================+", lf, "|", 0x9, "Calculador",0x9, "|", lf, "+=======================+", lf, null
  ; Label from calc
  label_value_one: db "First number : ", null
  label_value_two: db "Second number: ", null

  ; Label from opc
  label_opc_sum:  db lf, "1 - Addition", lf, null
  label_opc_sub:  db lf, "2 - Subtraction", lf, null
  label_opc_mult: db lf, "3 - Multiplication", lf, null
  label_opc_div:  db lf, "4 - Division", lf, null

  ;; lebel msgs
  prompt:     db lf, "> ", null
  msg_error:  db lf, "Number invalid", lf, null
  msg_end:    db lf, "The End", lf, null
  
  ;; lebel process
  process_sum:      db lf, "Addition process...", lf, null
  process_sub:      db lf, "Subtraction process...", lf, null
  process_mult:     db lf, "Multiplication process...", lf, null
  process_division: db lf, "Division process...", lf, null

  ;; Default
  sizeValues dd 0xA 


section .bss
  value_one resb 1
  value_two resb 1
  value_opc resb 1
  value_result resb 1
  
  buffer resb 0xA

section .text
  global _start

  _start:
    ; Print title
    mov ecx, title
    call _print
 
 ; get values
    mov ecx, label_value_one
    call _print
    mov eax, sys_read
    mov ebx, stdin
    mov ecx, value_one
    mov edx, 0x3
    int sys_go

    mov ecx, label_value_two
    call _print
    mov eax, sys_read
    mov ebx, stdin
    mov ecx, value_two
    mov edx, 0x3
    int sys_go

  ; OPTIONS -----------------------------
    
    ; Addition
    mov ecx, label_opc_sum
    call _print

    ; Subtraction
    mov ecx, label_opc_sub
    call _print

    ; Multiplication
    mov ecx, label_opc_mult
    call _print

    ; Division
    mov ecx, label_opc_div
    call _print

    ; prompt
    mov ecx, prompt
    call _print  
    mov eax, sys_read
    mov ebx, stdin
    mov ecx, value_opc
    mov edx, 0x1
    int sys_go

  ; Switch option --------------------------

    ; verify the opc
    mov ah, [value_opc]
    sub ah, "0"
    
    cmp ah, 4
    jg _error
    cmp ah, 1
    jl _error
 
    ; verify option choose
    cmp ah, 1
    je _addition
    cmp ah, 2
    je _subtraction
    cmp ah, 3
    je _multiplication
    cmp ah, 4
    je _division
  
  ; Functions
  _addition:
    mov ecx, process_sum
    call _print

    xor eax, eax
    xor ebx, ebx 
    
    lea esi, [value_one]
    mov ecx, 0x1
    call _string_to_int

    lea esi, [value_one]
    mov ecx, 0x1
    call _string_to_int2
    add eax, ebx

    lea esi, [buffer]
    call _int_to_string
    mov ecx, buffer
    call _print

    jmp _end
  
  _subtraction:
    mov ecx, process_sub
    call _print
    jmp _end

  _multiplication:
    mov ecx, process_mult
    call _print
    jmp _end
  
  _division:
    mov ecx, process_division
    call _print
    jmp _end

  ; Methods
  _error:
    mov ecx, msg_error
    call _print
    jmp _end

  _getOpt:
    mov eax, sys_read
    mov ebx, stdin
    mov ecx, value_opc
    mov edx, 0x1
    int sys_go
    ret
  
  _string_to_int:
    xor ebx, ebx
  .next_char:
    movzx eax, byte[esi]
    inc esi
    sub al, "0"
    imul ebx, 10
    add ebx, eax
    loop .next_char
    mov eax, ebx
    ret
  
  _string_to_int2:
    xor ebx, ebx
    .next_char:
      movzx eax, byte[esi]
      inc esi
      sub al, "0"
      imul ebx, 10
      add ebx, eax
      loop .next_char
      ret

  _int_to_string:
    add esi, 9
    add byte[esi], 0
    add ebx, 10
    .next_char:
      xor edx, edx
      div ebx
      add dl, '0'
      dec esi
      mov [esi], dl
      test eax, eax
      jnz .next_char
      mov eax, esi
      ret

  _end:
    mov ecx, msg_end
    call _print

    mov eax, sys_exit
    mov ebx, ret_exit
    int sys_go
