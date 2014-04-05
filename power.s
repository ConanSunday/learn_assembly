 .section .data
 .section .text

 .globl _start
_start:
 pushl $3   # push second param l=long
 pushl $2   # push first param
 
 call power # call func
 add $8, %esp #move point position
 pushl %eax   #save the power(2,3) value

 pushl $2   # push second param
 pushl $5   # push first param
 call power # call func
 add $8, %esp  # move point position

 popl %ebx  # pop power(2,3) to ebx

 addl %eax, %ebx # add eax , ebx  ebx saved
 
 movl $1, %eax  # call system exit()
 int $0x80

 # def power function
 .type power, @function
power:
 pushl %ebp   # save old base pointer
 movl %esp, %ebp # change base pointer to stack pointer 
 subl $4, %esp  #reserved space for local storage
 
 movl 8(%ebp), %ebx  #save first param to ebx 
 movl 12(%ebp), %ecx #save second param to ecx

 movl %ebx, -4(%ebp) #save current result

power_loop_start:
 cmpl $1, %ecx  #if power == 1
 je end_power   #has result 

 movl -4(%ebp), %eax #get current result and push to eax
 imull %ebx, %eax #ebx * eax
 movl %eax, -4(%ebp) #save
 
 decl %ecx # minus 
 jmp power_loop_start

end_power:
 movl -4(%ebp), %eax  # move value to eax
 movl %ebp, %esp      # restoration stack pointer
 popl %ebp            # restoration base pointer
 ret
 
