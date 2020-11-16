#
#  MIEI 19/20 FCT/UNL
#


########
# int match( int a, int b, int c )
#
.text
.globl	match

match:
    push %ebp
    mov %esp, %ebp
    
    mov $0, %eax # %eax = false.
    mov 8(%ebp), %ecx # %ecx = a.
    mov 12(%ebp), %edx # %edx = b.
    
    test %edx, %ecx # Checks if a and b don't have any bits in common.
    jz end
    test 16(%ebp), %ecx # Checks if a and c have any bits in common.
    jnz end
    test 16(%ebp), %edx # Checks if b and c have any bits in common.
    jnz end
    
    mov $1, %eax # %eax = true.
    
end:
    pop %ebp
    ret
