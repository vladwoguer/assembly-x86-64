; ---------------------
; Programa kill process
; ---------------------

          global    _start

          section   .text
_start:   mov       rax, 62                 ; system call for sys_kill
          mov       rdi, 12478              ; PID
          mov       rsi, 9                  ; address of string to output
          syscall                           ; invoke operating system to do the write
          mov       rax, 60                 ; system call for exit
          xor       rdi, rdi                ; exit code 0
          syscall                           ; invoke operating system to exit


