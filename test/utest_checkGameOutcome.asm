# adresse an der der speicherstand gespeichert ist
.eqv board 0x10008000

li a0, board
li a1, 1
li a2, 2
sw a1, 0(gp)
sw a1, 4(gp)
sw a1, 8(gp)
sw a2, 12(gp)
sw a2, 16(gp)
sw a2, 24(gp)
jal checkGameOutcome
mv s2, a0

li a0, board
li a1, 2
li a2, 1
sw a1, 0(gp)
sw a1, 4(gp)
sw a1, 8(gp)
sw a2, 12(gp)
sw a2, 16(gp)
sw a2, 24(gp)
jal checkGameOutcome
mv s3, a0

li a0, board
li a1, 1
li a2, 2
# unset values from above to zero
sw zero, 0(gp)
sw zero, 4(gp)
sw zero, 8(gp)
sw zero, 12(gp)
sw zero, 16(gp)
sw zero, 24(gp)
jal checkGameOutcome
mv s4, a0

li a0, board
li a1, 2
li a2, 1
sw a1, 0(gp)
sw a2, 4(gp)
sw a1, 8(gp)
sw a1, 12(gp)
sw a2, 16(gp)
sw a2, 20(gp)
sw a2, 24(gp)
sw a1, 28(gp)
sw a1, 32(gp)
jal checkGameOutcome
mv s5, a0

li a7, 10
ecall

.include "../src/check_end_game.asm"
