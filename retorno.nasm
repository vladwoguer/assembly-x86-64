section .text

global _start

_start:
  ; sys_call para retorno do programa
  ; valor a ser retornado
  mov eax, 1
  mov ebx, 2
  int 0x80