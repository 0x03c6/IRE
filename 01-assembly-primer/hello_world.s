; nasm -f elf64 hello_world.s && ld -o hello_world hello_world.o
section .rodata
  hello: db "Hello World", 0xa, 0
  hello_len: equ $ - hello

section .text
global _start
_start:
  mov rax, 1          ; write system call
  mov rdi, 1          ; standard output file descriptor
  mov rsi, hello      ; string source
  mov rdx, hello_len  ; length
  syscall

  mov rax, 60         ; exit
  syscall

