# adresse an der der speicherstand gespeichert ist
.eqv board 0x10008000

li a0, board
li a1, 1
sw a1, 0(gp)
sw a1, 4(gp)
sw a1, 8(gp)
jal getWinningCondition
mv s2, a0

jal clean_board

li a0, board
li a1, 2
sw a1, 12(gp)
sw a1, 16(gp)
sw a1, 20(gp)
jal getWinningCondition
mv s3, a0

jal clean_board

li a0, board
li a1, 2
sw a1, 24(gp)
sw a1, 28(gp)
sw a1, 32(gp)
jal getWinningCondition
mv s4, a0

jal clean_board

li a0, board
li a1, 2
sw a1, 0(gp)
sw a1, 12(gp)
sw a1, 24(gp)
jal getWinningCondition
mv s5, a0

jal clean_board

li a0, board
li a1, 2
sw a1, 4(gp)
sw a1, 16(gp)
sw a1, 28(gp)
jal getWinningCondition
mv s6, a0

jal clean_board

li a0, board
li a1, 2
sw a1, 8(gp)
sw a1, 20(gp)
sw a1, 32(gp)
jal getWinningCondition
mv s7, a0

jal clean_board

li a0, board
li a1, 2
sw a1, 0(gp)
sw a1, 16(gp)
sw a1, 32(gp)
jal getWinningCondition
mv s8, a0

jal clean_board

li a0, board
li a1, 2
sw a1, 24(gp)
sw a1, 16(gp)
sw a1, 8(gp)
jal getWinningCondition
mv s9, a0

jal clean_board

li a0, board
jal getWinningCondition
mv s10, a0


li a7, 10
ecall

clean_board:
li a1, 0
sw a1, 0(gp)
sw a1, 4(gp)
sw a1, 8(gp)
sw a1, 12(gp)
sw a1, 16(gp)
sw a1, 20(gp)
sw a1, 24(gp)
sw a1, 28(gp)
sw a1, 32(gp)
ret

.include "../src/check_end_game.asm"
