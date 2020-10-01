# if the op1 and op2 hava different sign
# there will be no carry out.
# {op1_sign, op2_sign, ans_sign} = {1, 1, 0} or {0, 0, 1}
# in 2 instructions
# the largest op2 for op1 is ~op1 (unsigned)
# so we need to compare op2 and ~op1
# the 'not x' could be 'x xor 0xffffffff'

# test 1 passed

# li $t3, 0x80000000
# li $t4, 0x7fffffff

# test 2 passed

# li $t3, 0x00000000
# li $t4, 0xffffffff

# test 3 passed

# li $t3, 0x00000001
# li $t4, 0xffffffff

xori $t3, $t3, 0xffffffff
sltu $t2, $t3, $t4
