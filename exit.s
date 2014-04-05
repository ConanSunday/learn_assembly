 .section .data
 .section .text
 .globl _start
_start:
 movl $1, %eax  #exit program 

 movl $0, %ebx  #return system status

 int $0x80      #wake kernel 

