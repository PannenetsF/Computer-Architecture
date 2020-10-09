	.data
	# This shows you can use a .word and directly encode the value in hex
	# if you so choose
num1:	.word 0x4b800000 # 16777216.000000
num2:	.float 2.1
num0:   .float 0.0
result:	.word 0
string: .asciiz "\n"
string1: .asciiz "(a+b)+c is "
string2: .asciiz "a+(b+c) is "

	.text
main:
	la $t0, num1
	lwc1 $f2, 0($t0) # num1 b 
	lwc1 $f3, 0($t0) # num1 c 
	lwc1 $f4, 4($t0) # num2 a 

	# Print out the values of the summands

    # num1
	li $v0, 2
	mov.s $f12, $f2
	syscall

    # \n 
	li $v0, 4
	la $a0, string
	syscall

    # num2 
	li $v0, 2
	mov.s $f12, $f4
	syscall

    # \n 
	li $v0, 4
	la $a0, string
	syscall

    # (a+b)+c 
	li $v0, 4
	la $a0, string1
	syscall
    # a+b 
	add.s $f12, $f2, $f4
    # +c 
	add.s $f12, $f12, $f3

	# Transfer the value from the floating point reg to the integer reg

	swc1 $f12, 8($t0)
	lw $s0, 8($t0)

	# At this point, $f12 holds the sum, and $s0 holds the sum which can
	# be read in hexadecimal

    # print ans in f12 
	li $v0, 2
	syscall


	li $v0, 4
	la $a0, string
	syscall

    # a+(b+c)
	li $v0, 4
	la $a0, string2
	syscall
    # c+b 
	add.s $f12, $f2, $f3
    # +a 
	add.s $f12, $f12, $f4

	# Transfer the value from the floating point reg to the integer reg

	swc1 $f12, 8($t0)
	lw $s0, 8($t0)

	# At this point, $f12 holds the sum, and $s0 holds the sum which can
	# be read in hexadecimal

    # print ans in f12 
	li $v0, 2
	syscall


	li $v0, 4
	la $a0, string
	syscall




	# This jr crashes MARS
	# jr $ra
