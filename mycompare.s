#
#  MIEI 19/20 FCT/UNL
#


########
# int mycompare( int size, int x[], int y[] )
#
.text
.globl	mycompare

mycompare:
    push %ebp
    mov %esp, %ebp
    
    mov $0, %eax # Initial position for the array comparisons.
    mov 12(%ebp), %ecx #
    mov 16(%ebp), %edx # The arrays' memory positions.
    mov %ebx, -4(%ebp) # Saving %ebx in the stack, so its' value can be recovered at the end.
    
loop:
    cmp 8(%ebp), %eax # Checks if the end of the arrays' has been reached.
    jz equal
    
    mov (%edx, %eax, 4), %ebx # %ebx = x[%eax * 4].
    cmp (%ecx, %eax, 4), %ebx # Checks if the arrays' integers at the current position are different.
    jnz end
    inc %eax # %eax++
    jmp loop
    
equal:
    mov $0xFFFFFFFF, %eax # %eax = -1.
    
end:
    mov -4(%ebp), %ebx # Resets %ebx to it's initial value.
    mov %ebp, %esp
    pop %ebp
    ret
