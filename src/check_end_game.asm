checkGameOutcome:                       # @checkGameOutcome
	addi sp, sp, -40
	sw a1, 0(sp)
	sw a2, 4(sp)
	sw a3, 8(sp)
	sw a4, 12(sp)
	sw a5, 16(sp)
	sw a6, 20(sp)
	sw a7, 24(sp)
	sw t0, 28(sp)
	sw s0, 32(sp)
	sw ra, 36(sp) # callee save

        addi    sp, sp, -16
        sw      ra, 12(sp)                      # 4-byte Folded Spill
        sw      s0, 8(sp)                       # 4-byte Folded Spill
        mv      s0, a0
        call    getWinningCondition
        beqz    a0, .LBB0_3
        slli    a0, a0, 2
        add     a0, a0, s0
        lw      a0, 0(a0)
.LBB0_2:
        lw      s0, 8(sp)                       # 4-byte Folded Reload
        lw      ra, 12(sp)                      # 4-byte Folded Reload
        addi    sp, sp, 16
        ret
.LBB0_3:
        lw      a0, 0(s0)
        blez    a0, .LBB0_12
        lw      a0, 4(s0)
        blez    a0, .LBB0_12
        lw      a0, 8(s0)
        blez    a0, .LBB0_12
        lw      a0, 12(s0)
        blez    a0, .LBB0_12
        lw      a0, 16(s0)
        blez    a0, .LBB0_12
        lw      a0, 20(s0)
        blez    a0, .LBB0_12
        lw      a0, 24(s0)
        blez    a0, .LBB0_12
        lw      a0, 28(s0)
        blez    a0, .LBB0_12
        lw      a1, 32(s0)
        addi    a0, zero, 3
        bgtz    a1, .LBB0_2
.LBB0_12:
        mv      a0, zero
        lw      s0, 8(sp)                       # 4-byte Folded Reload
        lw      ra, 12(sp)                      # 4-byte Folded Reload
        addi    sp, sp, 16
        
        lw a1, 0(sp)
	lw a2, 4(sp)
	lw a3, 8(sp)
	lw a4, 12(sp)
	lw a5, 16(sp)
	lw a6, 20(sp)
	lw a7, 24(sp)
	lw t0, 28(sp)
	lw s0, 32(sp)
	lw ra, 36(sp)
	addi sp, sp, 40 # callee restore
	
        ret
allesBelegt:                            # @allesBelegt
        lw      a1, 0(a0)
        blez    a1, .LBB1_9
        lw      a1, 4(a0)
        blez    a1, .LBB1_9
        lw      a1, 8(a0)
        blez    a1, .LBB1_9
        lw      a1, 12(a0)
        blez    a1, .LBB1_9
        lw      a1, 16(a0)
        blez    a1, .LBB1_9
        lw      a1, 20(a0)
        blez    a1, .LBB1_9
        lw      a1, 24(a0)
        blez    a1, .LBB1_9
        lw      a1, 28(a0)
        blez    a1, .LBB1_9
        lw      a1, 32(a0)
        addi    a0, zero, 1
        bgtz    a1, .LBB1_10
.LBB1_9:
        mv      a0, zero
.LBB1_10:
        ret
getWinningCondition:                    # @getWinningCondition
        lw      a2, 0(a0)
        lw      a5, 4(a0)
        bne     a2, a5, .LBB2_2
        lw      a1, 8(a0)
        xor     a3, a2, a1
        seqz    a3, a3
        snez    a1, a1
        and     a3, a3, a1
        addi    a1, zero, 1
        bnez    a3, .LBB2_17
.LBB2_2:
        lw      a4, 12(a0)
        lw      a6, 16(a0)
        bne     a4, a6, .LBB2_4
        lw      a1, 20(a0)
        xor     a3, a4, a1
        seqz    a3, a3
        snez    a1, a1
        and     a3, a3, a1
        addi    a1, zero, 3
        bnez    a3, .LBB2_17
.LBB2_4:
        lw      a7, 24(a0)
        lw      t0, 28(a0)
        bne     a7, t0, .LBB2_6
        lw      a1, 32(a0)
        xor     a3, a7, a1
        seqz    a3, a3
        snez    a1, a1
        and     a3, a3, a1
        addi    a1, zero, 8
        bnez    a3, .LBB2_17
.LBB2_6:
        bne     a2, a4, .LBB2_8
        xor     a1, a2, a7
        seqz    a1, a1
        snez    a3, a7
        and     a3, a3, a1
        addi    a1, zero, 6
        bnez    a3, .LBB2_17
.LBB2_8:
        bne     a5, a6, .LBB2_10
        xor     a1, a5, t0
        seqz    a1, a1
        snez    a3, t0
        and     a3, a3, a1
        addi    a1, zero, 7
        bnez    a3, .LBB2_17
.LBB2_10:
        lw      a3, 8(a0)
        lw      a1, 20(a0)
        bne     a3, a1, .LBB2_12
        lw      a1, 32(a0)
        xor     a4, a3, a1
        seqz    a4, a4
        snez    a1, a1
        and     a4, a4, a1
        addi    a1, zero, 5
        bnez    a4, .LBB2_17
.LBB2_12:
        bne     a2, a6, .LBB2_14
        lw      a0, 32(a0)
        xor     a1, a2, a0
        seqz    a1, a1
        snez    a0, a0
        and     a0, a0, a1
        addi    a1, zero, 4
        bnez    a0, .LBB2_17
.LBB2_14:
        bne     a3, a6, .LBB2_16
        xor     a0, a6, a7
        seqz    a0, a0
        snez    a1, a7
        and     a0, a0, a1
        addi    a1, zero, 2
        bnez    a0, .LBB2_17
.LBB2_16:
        mv      a1, zero
.LBB2_17:
        mv      a0, a1
        ret
getWinner:                              # @getWinner
        slli    a1, a1, 2
        add     a0, a0, a1
        lw      a0, 0(a0)
        
        ret
