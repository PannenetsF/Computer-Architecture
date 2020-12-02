
.data
str: .asciiz "8901"
str1: .asciiz "89z01"
str2: .byte 50,52,0
str3: .byte 51,79,52,0
.text


start:
	la $a0, str1
	jal convert
	move $a0, $v0
	li $v0, 1
	syscall
	li $v0, 10
	syscall

convert:
	move $t0, $a0
	li $t2, 0
loop:
	lbu $t1, 0($t0)
	# move $a0, $t1
	# li $v0, 1
	# syscall
	beq $t1, $zero, finish
	blt $t1, 48, error
	bgt $t1, 57, error
	sub $t1, $t1, 48
	mul $t2, $t2, 10
	add $t2, $t2, $t1
	addi $t0, $t0, 1
	j loop


finish:
	move $v0, $t2
	jr $ra
error:
	li $v0, -1
	jr $ra