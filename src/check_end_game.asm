#######
# check if every cell is occupied
#######
allesBelegt:
    lw      a1, 0(a0)
    blez    a1, .LBB0_9
    lw      a1, 4(a0)
    blez    a1, .LBB0_9
    lw      a1, 8(a0)
    blez    a1, .LBB0_9
    lw      a1, 12(a0)
    blez    a1, .LBB0_9
    lw      a1, 16(a0)
    blez    a1, .LBB0_9
    lw      a1, 20(a0)
    blez    a1, .LBB0_9
    lw      a1, 24(a0)
    blez    a1, .LBB0_9
    lw      a1, 28(a0)
    blez    a1, .LBB0_9
    lw      a1, 32(a0)
    addi    a0, zero, 1
    bgtz    a1, .LBB0_10
    .LBB0_9:
        mv      a0, zero
    .LBB0_10:
        ret

#######
# check which winning condition is true
#######
check_finished:
    mv      a1, a0
    lw      a3, 0(a0)
    lw      a5, 4(a0)
    lw      a2, 8(a0)
    xor     a0, a3, a5
    seqz    a4, a0
    addi    a0, zero, 1
    beq     a2, a4, check_finished.return
    lw      t2, 12(a1)
    lw      a7, 16(a1)
    lw      t0, 20(a1)
    xor     a0, t2, a7
    seqz    a4, a0
    addi    a0, zero, 3
    beq     t0, a4, check_finished.return
    lw      a6, 24(a1)
    lw      t1, 28(a1)
    lw      a1, 32(a1)
    xor     a0, a6, t1
    seqz    a4, a0
    addi    a0, zero, 8
    beq     a1, a4, check_finished.return
    xor     a0, a3, t2
    seqz    a4, a0
    addi    a0, zero, 6
    beq     a6, a4, check_finished.return
    xor     a0, a5, a7
    seqz    a4, a0
    addi    a0, zero, 7
    beq     t1, a4, check_finished.return
    xor     a0, a2, t0
    seqz    a4, a0
    addi    a0, zero, 5
    beq     a1, a4, check_finished.return
    xor     a0, a3, a7
    seqz    a3, a0
    addi    a0, zero, 4
    beq     a1, a3, check_finished.return
    xor     a0, a2, a7
    seqz    a0, a0
    xor     a0, a6, a0
    seqz    a0, a0
    slli    a0, a0, 1
    check_finished.return:
        ret

#######
# gets the winner based on winning condition
#######
get_winner:
    slli    a1, a1, 2
    add     a0, a0, a1
    lw      a0, 0(a0)
    ret

#######
# checks the game outcome
# -------
# inputs: a0 - array start address
#######
check_game_outcome:
    lw      a1, 0(a0)
    lw      a2, 4(a0)
    lw      a3, 8(a0)
    xor     a4, a1, a2
    seqz    a5, a4
    addi    a4, zero, 1
    beq     a3, a5, .LBB3_8
    lw      t3, 12(a0)
    lw      t2, 16(a0)
    lw      a6, 20(a0)
    xor     a4, t3, t2
    seqz    a5, a4
    addi    a4, zero, 3
    beq     a6, a5, .LBB3_8
    lw      t0, 24(a0)
    lw      a7, 28(a0)
    lw      t1, 32(a0)
    xor     a4, t0, a7
    seqz    a5, a4
    addi    a4, zero, 8
    beq     t1, a5, .LBB3_8
    xor     a4, a1, t3
    seqz    a5, a4
    addi    a4, zero, 6
    beq     t0, a5, .LBB3_8
    xor     a4, a2, t2
    seqz    a5, a4
    addi    a4, zero, 7
    beq     a7, a5, .LBB3_8
    xor     a4, a3, a6
    seqz    a5, a4
    addi    a4, zero, 5
    beq     t1, a5, .LBB3_8
    xor     a4, a1, t2
    seqz    a5, a4
    addi    a4, zero, 4
    beq     t1, a5, .LBB3_8
    xor     a4, a3, t2
    seqz    a5, a4
    addi    a4, zero, 2
    bne     t0, a5, .LBB3_10
    .LBB3_8:
        slli    a1, a4, 2
        add     a0, a0, a1
        lw      a0, 0(a0)
    check_game_outcome.return:
        ret
    .LBB3_10:
        sgtz    a0, a1
        sgtz    a1, a2
        and     a0, a0, a1
        sgtz    a1, a3
        and     a0, a0, a1
        sgtz    a1, t3
        and     a0, a0, a1
        sgtz    a1, t2
        and     a0, a0, a1
        sgtz    a1, a6
        and     a0, a0, a1
        sgtz    a1, t0
        and     a0, a0, a1
        sgtz    a1, a7
        and     a0, a0, a1
        sgtz    a1, t1
        and     a1, a1, a0
        addi    a0, zero, 3
        bnez    a1, check_game_outcome.return
        mv      a0, zero
        ret