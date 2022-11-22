segment .data
  lf        equ 0xA  ; Line Feed
  null      equ 0xD  ; Final da String
  sys_go    equ 0x80 ; Envia informacao ao SO

  ; EAX
  sys_exit  equ 0x1  ; Codigo de chamada para finalizar
  sys_read  equ 0x3  ; Operacao de leitura
  sys_write equ 0x4  ; Operacao de escrita
 
 ; EBX
  ret_exit  equ 0x0  ; Operacao realizada com Sucesso
  stdin     equ 0x0  ; Entrada padrao
  stdout    equ 0x1  ; Saida padrao

segment .text

_outputString:
  

_calcSizeString:
  mov edx, ecx

.proxChar:
  cmp byte[edx], null
  jz end
  inc edx
  jmp .proxChar

end:
  sub edx, ecx
  ret

