# test
    li $a0, 15
    jal fib
    move $a0, $v0
    li $v0, 1
    syscall
    li $v0, 10
    syscall
#

fib: 
    bne $a0, $zero, fibne0 # if n != 0, jump to fibne0
    move $v0, $zero # n==0 return 0
    jr $ra

fibne0: # Assert: n != 0
    li $v0, 1
    bne $a0, $v0, fibne1 # if n != 1, jump to fibne0
    jr $ra # n==1 return 1

fibne1: # Assert: n > 1
# Compute fib(n-l)
    addi $sp, $sp, -8 
    sw $ra, 4($sp) # push return address
    sw $a0, 0($sp) # push n
    addi $a0, $a0, -1 # pass argument n-1 ...
    jal fib  # call fib()
    move $t1, $v0 # $tl = fib(n-l)
    lw $a0, 0($sp) # pop n
    addi $sp, $sp, 4 # $sp: $old_sp -4
# Compute fib(n-2)
    addi $sp, $sp, -8 
    sw $a0, 4($sp) # push n
    sw $t1, 0($sp) # push fib(n-l)
    addi $a0, $a0, -2 # pass argument n-2 ...
    jal fib # call fib()
    move $t2, $v0 # $t2 = fib(n-2)
    lw $t1, 0($sp) # pop fib(n-l) ...
    lw $a0, 4($sp) # pop n
    lw $ra, 8($sp) # pop return address
    addi $sp, $sp, 12 
# Return fib(n-l) + fib(n-2)
    add $v0, $t1, $t2 # $v0: fib(n) = fib(n-l) + fib(n-2)
    jr $ra # return to caller
