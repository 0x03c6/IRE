section .rodata
  welcome: db "Welcome what is your name: ", 0
  welcome_len: equ $ - welcome
  meet: db "Nice to meet you ", 0
  meet_len: equ $ - meet

section .text
global _start
_start:
  call main           ; call main (push return address on stack)

  mov rax, 60         ; exit
  syscall
main:
  push rbp
  mov rbp, rsp
  sub rsp, 0x30

  mov rax, 1            ; write system call
  mov rdi, 1            ; standard output file descriptor
  mov rsi, welcome      ; welcome string
  mov rdx, welcome_len  ; welcome string length
  syscall

  mov rax, 0            ; read system call
  mov rdi, 0            ; standard input file descriptor
  lea rsi, qword [rbp-0x20] ; load address of stack buffer
  mov rdx, 0x20         ; read 32 bytes as length
  syscall

  mov rax, 1            ; write system call
  mov rdi, 1            ; standard output file descriptor
  mov rsi, meet         ; source string
  mov rdx, meet_len     ; source string length
  syscall

  mov rax, 1            ; write system call
  mov rdi, 1            ; standard output file descriptor
  lea rsi, qword [rbp-0x20] ; source buffer to write
  mov rdx, 0x20         ; length of source buffer
  syscall

  leave
  ret
