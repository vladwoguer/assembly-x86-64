




 

section .data

  v1 dw '105', 0xa

section .bss
  buffer: resb 10


section .text

  global _start

_start:
  lea esi, [v1]
  mov ecx, 3
  call string_to_int
  add eax, 1    ; Adiciona o elemento a variável
 
  lea esi, [buffer]
  call int_to_string
  


  
  ; imprimir na saída
  mov ecx, buffer
  call imprimir

_final: ; bloco final depois desse bloco nada é executado
  
  mov eax, 1
  mov ebx, 0
  int 0x80

; A partir daqui os labels não são chamados em sequencia como no corpo do _start e _final
; Sendo assim úteis para declarar funções e procedimentos



imprimir:  
  mov eax, 4                                                                                   
  mov ebx, 1                                                                                   
  mov edx, 10                                                                                   
  int 0x80     
  ret ; para a função/procedimento retornar para depois de onde foi chamada


; esi = ponteiro da string
; ecx = numero de digitos
; saída: eax
string_to_int:
  xor ebx, ebx ; limpa ebx
.proximo_digito:
  movzx eax, byte[esi]               ; 00 00 00 byte[esi]
  inc esi                            ; esi++
  sub al, '0'                        ; string(a1)
  imul ebx, 10                       ; ebx *= 10
  add ebx, eax                       ; ebx = ebx + eax 
  loop .proximo_digito               ; while(--ecx)
  mov eax, ebx                       ; eax = ebx
  ret

int_to_string:
  add esi, 9
  mov byte[esi], 0
  mov ebx, 10

.proximo_digito:
  xor edx, edx
  div ebx
  add dl, '0'
  dec esi
  mov [esi], dl
  test eax, eax
  jnz .proximo_digito ; eax == 0
  mov eax, esi
  ret








  





  










                                                                            
                                                                             
                                                                             


