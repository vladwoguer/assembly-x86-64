; 1 byte (8 bit): byte, DB
; 2 bytes (16 bit): word, DW
; 4 bytes (32 bit): dword, DD
; 8 bytes (64 bit): qword, DQ
; 10 bytes (80 bit): tword, DT

section .data
  x dd 50
  y dd 20
  msg1 db 'X maior que Y', 0xa
  len1 equ $- msg1
  msg2 db 'Y maior que X', 0xa
  len2 equ $- msg2

section .text

global _start

_start:
  mov eax, DWORD [x]
  mov ebx, DWORD [y]
  cmp eax, ebx ; comparação
  ; je ==
  ; jg >
  ; jge >=
  ; jl <
  ; jle <=
  ; jne !=
  jge maior
  mov edx, len2
  mov ecx, msg2
  jmp final ; salto incondicional

maior:
  mov edx, len1
  mov ecx, msg1

final:
  ; imprime
  mov ebx, 1
  mov eax, 4
  int 0x80

  ; retorna
  mov eax, 1
  int 0x80