; --------------------
; Entrada de dados
; --------------------

SYS_EXIT equ 1
RET_EXIT equ 5
SYS_READ equ 3
SYS_WRITE equ 4
STD_IN equ 0
STD_OUT equ 1
MAX_IN equ 10

segment .data
  msg db 'Entre com seu nome: ', 0xA, 0xD
  len equ $- msg

segment .bss
  nome resb 2

segment .text

global _start

_start:
  ; AX acumulador para operações numéricas
  ; BX acumuldaor de registro base
  ; CX acumuldor de conta para operações com strings
  ; DX registro de dados
  ; e-> 32 bits Ex EAX
  ; r-> 64 bits Ex RAX

  ; Mostrar mensagem  
  mov eax, SYS_WRITE
  mov ebx, STD_OUT
  mov ecx, msg
  mov edx, len
  int 0x80

  ; Entrada de dados
  mov eax, SYS_READ
  mov ebx, STD_IN
  mov ecx, nome
  mov edx, MAX_IN
  int 0x80

  ; Mostrar lido  
  mov eax, SYS_WRITE
  mov ebx, STD_OUT
  mov ecx, nome
  mov edx, MAX_IN
  int 0x80  

  exit:
   mov eax, SYS_EXIT
   mov ebx, RET_EXIT ; xor EBX, EBX
   int 0x80
