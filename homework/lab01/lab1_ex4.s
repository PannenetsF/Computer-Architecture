        .file   1 "a.c"
        .section .mdebug.abi32
        .previous
        .nan    legacy
        .module fp=xx
        .module nooddspreg
        .abicalls
        .text
        .section        .rodata.str1.4,"aMS",@progbits,1
        .align  2
$LC0:
        .ascii  "%d values copied\012\000"
        .section        .text.startup,"ax",@progbits
        .align  2
        .globl  main
        .set    nomips16
        .set    nomicromips
        .ent    main
        .type   main, @function
main:
        .frame  $sp,32,$31              # vars= 0, regs= 1/0, args= 16, gp= 8
        .mask   0x80000000,-4
        .fmask  0x00000000,0
        .set    noreorder
        .set    nomacro
        lui     $2,%hi(source)
        lui     $28,%hi(__gnu_local_gp)
        addiu   $sp,$sp,-32
        lw      $3,%lo(source)($2)
        addiu   $28,$28,%lo(__gnu_local_gp)
        sw      $31,28($sp)
        .cprestore      16
        beq     $3,$0,$L4
        nop

        lw      $4,%got(dest)($28)
        addiu   $2,$2,%lo(source)
        move    $6,$0
$L3:
        sw      $3,0($4)
        addiu   $6,$6,1
        lw      $3,4($2)
        addiu   $4,$4,4
        addiu   $2,$2,4
        bne     $3,$0,$L3
        nop

$L2:
        lui     $5,%hi($LC0)
        lw      $25,%call16(__printf_chk)($28)
        li      $4,1                    # 0x1
        addiu   $5,$5,%lo($LC0)
        .reloc  1f,R_MIPS_JALR,__printf_chk
1:      jalr    $25
        nop

        move    $2,$0
        lw      $31,28($sp)
        addiu   $sp,$sp,32
        jr      $31
        nop

$L4:
        move    $6,$0
        .option pic0
        b       $L2
        nop

        .option pic2
        .set    macro
        .set    reorder
        .end    main
        .size   main, .-main

        .comm   dest,40,4
        .globl  source
        .data
        .align  2
        .type   source, @object
        .size   source, 28
source:
        .word   3
        .word   1
        .word   4
        .word   1
        .word   5
        .word   9
        .word   0
        .ident  "GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
