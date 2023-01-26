// gcc -o demo demo.c
#include <stdio.h>
#include <string.h>

int main(int argc, char** argv) {
  if (argv[1])
    puts((!strcmp(argv[1], "5up3r_s7r0ng_p45sw0rd"))
      ? "you win!"
      : "nope, not right");
  else
    printf("%s <password>\n", argv[0]);
  return 0;
}
