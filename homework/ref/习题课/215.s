set_array:
        add $sp, $sp, -52 # move stack pointer
        sw $fp, 48($sp) # save frame pointer
        sw $ra, 44($sp) # save return address
        sw $a0, 40($sp)  # save parameter (num)
        addi $fp, $sp, 48 # establish frame pointer
        add $s0, $zero, $zero # i = 0
        addi $t0, $zero, 10 # max iterations is 10
        
loop:   sll $t1, $s0, 2 # $tl = i * 4
        add $t2, $sp, $t1 # $t2 = address of array[i]
        add $a0, $a0, $zero # pass num as parameter
        add $a1, $s0, $zero # pass i as parameter
        jal compare # call compare (num,i)
        sw $v0, 0($t2) # array[i] = compare(num, i);
        addi $s0, $s0, 1 # i++
        bne $s0, $t0, loop # loop if != 10

        lw $a0, 40($sp) # restore parameter (num)
        lw $ra, 44($sp) # restore return address
        lw $fp, 48($sp) # restore frame pointer
        addi $sp, $sp, 52 # restore stack pointer
        jr $ra # return  

compare:
        addi $sp, $sp, -8 # move stack pointer
        sw $fp, 4($sp) # save frame pointer
        sw $ra, 0($sp) # save return address
        addi $fp, $sp, 4 # establish frame pointer
        jal sub # can jump directly to sub
        slt $v0, $v0, $zero # if sub(a,b) >= 0, return 1
        slti $v0, $v0, 1 
        lw $ra, 0($sp) # restore return address
        lw $fp, 4($sp) # restore frame pointer
        addi $sp, $sp, 8 # restore stack pointer
        jr $ra # return

sub:
        sub $v0, $a0, $a1 # return a-b
        jr $ra # return
