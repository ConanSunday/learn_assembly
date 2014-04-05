 .section .data

data_items:
  .long 3,67,34,222,45,75,54,34,44,33,22,11,16,0

  .section .text

  .globl _start
_start:
  movl $0, %edi      #move 0 to index register 
  movl data_items(, %edi,4), %eax #load the first byte 
  movl %eax, %ebx    #set default maximum 

start_loop:    
  cmpl $0, %eax     #start loop
  je loop_exit      # if eax == 0 exit loop

  incl %edi         #load next edi 
  movl data_items(, %edi,4), %eax #load next byte
  cmpl %ebx, %eax   #compare maximum and eax
  jle start_loop    # if eax <= ebx jump to start_loop

  movl %eax, %ebx   #else move eax to ebx
  
  jmp start_loop    #continue loop

loop_exit:
  # ebx already have maximum
  movl $1, %eax     #system exit()  
  int $0x80


