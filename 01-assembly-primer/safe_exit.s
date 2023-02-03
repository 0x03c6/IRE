; nasm -f elf64 safe_exit.s && ld -o safe_exit safe_exit.o
section .text
global _start
_start:
  ; exit system call
  mov rax, 60
  syscall

