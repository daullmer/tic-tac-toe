getValueAbove:                          # @getValueAbove
        addi    a2, zero, 3
        addi    a1, zero, 6
        blt     a0, a2, .VCC0_2
        addi    a1, zero, -3
.VCC0_2:
        add     a0, a0, a1
        slli    a0, a0, 2
        lui     a1, %hi(board)
        addi    a1, a1, %lo(board)
        add     a0, a0, a1
        lw      a0, 0(a0)
        ret
getValueBelow:                          # @getValueBelow
        addi    a2, zero, 5
        addi    a1, zero, -6
        blt     a2, a0, .VCC1_2
        addi    a1, zero, 3
.VCC1_2:
        add     a0, a0, a1
        slli    a0, a0, 2
        lui     a1, %hi(board)
        addi    a1, a1, %lo(board)
        add     a0, a0, a1
        lw      a0, 0(a0)
        ret
getLeftValue:                           # @getLeftValue
        lui     a1, 349525
        addi    a2, a1, 1366
        mulh    a1, a0, a2
        srli    a3, a1, 31
        add     a3, a3, a1
        addi    a1, a0, -1
        mulh    a2, a1, a2
        srli    a4, a2, 31
        add     a2, a2, a4
        beq     a3, a2, .VCC2_2
        addi    a1, a0, 2
.VCC2_2:
        slli    a0, a1, 2
        lui     a1, %hi(board)
        addi    a1, a1, %lo(board)
        add     a0, a0, a1
        lw      a0, 0(a0)
        ret
getRightValue:                          # @getRightValue
        lui     a1, 349525
        addi    a2, a1, 1366
        mulh    a1, a0, a2
        srli    a3, a1, 31
        add     a3, a3, a1
        addi    a1, a0, 1
        mulh    a2, a1, a2
        srli    a4, a2, 31
        add     a2, a2, a4
        beq     a3, a2, .VCC3_2
        addi    a1, a0, -2
.VCC3_2:
        slli    a0, a1, 2
        lui     a1, %hi(board)
        addi    a1, a1, %lo(board)
        add     a0, a0, a1
        lw      a0, 0(a0)
        ret
getBlockingMove:                       # @getBlockingMove
##### callee save
	addi sp, sp, -64
	sw a1, 0(sp)
	sw a2, 4(sp)
	sw a3, 8(sp)
	sw a4, 12(sp)
	sw a5, 16(sp)
	sw a6, 20(sp)
	sw a7, 24(sp)
	sw t0, 28(sp)
	sw ra, 32(sp)
	sw t1, 36(sp)
	sw t2, 40(sp)
	sw t3, 44(sp)
	sw t4, 48(sp)
	sw t5, 52(sp)
	sw t6, 56(sp)
	sw a0, 60(sp)
	
        lui     a0, %hi(board)
        lw      a2, %lo(board)(a0)
        beqz    a2, .VCC4_10
        addi    a0, a0, %lo(board)
        lw      a3, 4(a0)
.VCC4_2:
	la      a0, board
	addi    a0, a0, 8
	lw      t6, (a0)
        beqz    a3, .VCC4_13
.VCC4_3:
        seqz    a7, a2
        beqz    t6, .VCC4_15
.VCC4_4:
        lui     a0, %hi(board)
        addi    a0, a0, %lo(board)
        lw      a4, 12(a0)
        beqz    a4, .VCC4_17
        lw      t5, 16(a0)
.VCC4_6:
	la      a0, board
	addi    a0, a0, 20
	lw      t0, (a0)
        beqz    t5, .VCC4_19
.VCC4_7:
        beqz    t0, .VCC4_21
.VCC4_8:
        lui     a0, %hi(board)
        addi    a0, a0, %lo(board)
        lw      a6, 24(a0)
        beqz    a6, .VCC4_23
        lw      t3, 28(a0)
        j       .VCC4_24
.VCC4_10:
        addi    a0, a0, %lo(board)
        lw      a1, -4(a0)
        lw      a3, 4(a0)
        xor     a0, a1, a3
        seqz    a0, a0
        snez    a1, a3
        and     a1, a1, a0
        mv      a0, zero
        bnez    a1, .VCC4_12
        lui     a0, %hi(board)
        addi    a0, a0, %lo(board)
        lw      a1, 24(a0)
        lw      a0, 12(a0)
        xor     a1, a1, a0
        seqz    a1, a1
        snez    a0, a0
        and     a1, a1, a0
        mv      a0, zero
        beqz    a1, .VCC4_2
.VCC4_12:
	mv s5, a0 # return at s5
### callee restore
	lw a1, 0(sp)
	lw a2, 4(sp)
	lw a3, 8(sp)
	lw a4, 12(sp)
	lw a5, 16(sp)
	lw a6, 20(sp)
	lw a7, 24(sp)
	lw t0, 28(sp)
	lw ra, 32(sp)
	lw t1, 36(sp)
	lw t2, 40(sp)
	lw t3, 44(sp)
	lw t4, 48(sp)
	lw t5, 52(sp)
	lw t6, 56(sp)
	lw a0, 60(sp)


	addi sp, sp, 64

        ret
.VCC4_13:
        xor     a0, a2, t6
        seqz    a0, a0
        snez    a4, t6
        and     a4, a4, a0
        addi    a0, zero, 1
        bnez    a4, .VCC4_12
        lui     a4, %hi(board)
        addi    a4, a4, %lo(board)
        lw      a5, 28(a4)
        lw      a4, 16(a4)
        xor     a5, a5, a4
        seqz    a5, a5
        snez    a4, a4
        and     a4, a4, a5
        beqz    a4, .VCC4_3
        j       .VCC4_12
.VCC4_15:
        xor     a0, a3, a2
        seqz    a0, a0
        xori    a4, a7, 1
        and     a4, a4, a0
        addi    a0, zero, 2
        bnez    a4, .VCC4_12
        lui     a4, %hi(board)
        addi    a4, a4, %lo(board)
        lw      a5, 32(a4)
        lw      a4, 20(a4)
        xor     a5, a5, a4
        seqz    a5, a5
        snez    a4, a4
        and     a4, a4, a5
        beqz    a4, .VCC4_4
        j       .VCC4_12
.VCC4_17:
        lw      a5, 20(a0)
        lw      t5, 16(a0)
        xor     a0, a5, t5
        seqz    a0, a0
        snez    a5, t5
        and     a5, a5, a0
        addi    a0, zero, 3
        bnez    a5, .VCC4_12
        la      a5, board
	addi    a5, a5, 24
	lw      a5, (a5)
        xor     a1, a2, a5
        seqz    a1, a1
        snez    a5, a5
        and     a1, a1, a5
        beqz    a1, .VCC4_6
        j       .VCC4_12
.VCC4_19:
        xor     a0, a4, t0
        seqz    a0, a0
        snez    a1, t0
        and     a1, a1, a0
        addi    a0, zero, 4
        bnez    a1, .VCC4_12
        la      a1, board
	lw      a1, 28(a1)
        xor     a5, a3, a1
        seqz    a5, a5
        snez    a1, a1
        and     a1, a1, a5
        beqz    a1, .VCC4_7
        j       .VCC4_12
.VCC4_21:
        seqz    a0, a4
        xor     a1, t5, a4
        seqz    a1, a1
        xori    a0, a0, 1
        and     a1, a1, a0
        addi    a0, zero, 5
        bnez    a1, .VCC4_12
        la      a1, board
	lw      a1, 32(a1)
        xor     a5, t6, a1
        seqz    a5, a5
        snez    a1, a1
        and     a1, a1, a5
        beqz    a1, .VCC4_8
        j       .VCC4_12
.VCC4_23:
        lw      a1, 32(a0)
        lw      t3, 28(a0)
        xor     a0, a1, t3
        snez    a0, a0
        seqz    a1, t3
        or      a0, a0, a1
        xor     a1, a4, a2
        snez    a1, a1
        or      a1, a1, a7
        and     a1, a1, a0
        addi    a0, zero, 6
        beqz    a1, .VCC4_12
.VCC4_24:
	la      a0, board
	lw      a4, 32(a0)
        seqz    t4, a4
        bnez    t3, .VCC4_26
        seqz    a0, a3
        xor     a1, a6, a4
        snez    a1, a1
        or      a1, a1, t4
        xor     a3, t5, a3
        snez    a3, a3
        or      a0, a0, a3
        and     a1, a1, a0
        addi    a0, zero, 7
        beqz    a1, .VCC4_12
.VCC4_26:
        seqz    t1, t6
        seqz    t2, t5
        seqz    a3, a6
        beqz    a4, .VCC4_29
        xor     a0, a2, a4
        seqz    a0, a0
        and     a2, a0, t2
        addi    a0, zero, 4
        bnez    a2, .VCC4_12
        snez    a2, t5
        j       .VCC4_31
.VCC4_29:
        xor     a0, t3, a6
        snez    a0, a0
        or      a0, a0, a3
        xor     a1, t0, t6
        snez    a1, a1
        or      a1, a1, t1
        and     a1, a1, a0
        addi    a0, zero, 8
        beqz    a1, .VCC4_12
        xor     a1, a2, t5
        seqz    a1, a1
        snez    a2, t5
        and     a1, a1, a2
        and     a1, a1, t4
        bnez    a1, .VCC4_12
.VCC4_31:
        xor     a0, a4, t5
        seqz    a0, a0
        and     a0, a0, a2
        and     a4, a0, a7
        mv      a0, zero
        bnez    a4, .VCC4_12
        xor     a0, t6, t5
        seqz    a0, a0
        and     a0, a0, a2
        and     a3, a3, a0
        addi    a0, zero, 6
        bnez    a3, .VCC4_12
        xor     a0, t6, a6
        seqz    a0, a0
        snez    a1, a6
        and     a0, a0, a1
        and     a1, a0, t2
        addi    a0, zero, 4
        bnez    a1, .VCC4_12
        xor     a0, a6, t5
        seqz    a0, a0
        and     a0, a0, a2
        and     a1, a0, t1
        addi    a0, zero, 2
        bnez    a1, .VCC4_12
        addi    a0, zero, 999
        j .VCC4_12
