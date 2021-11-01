.data
board: .word 0 0 0 0 0 0 0 0 0

.text

la a0 board
jal random_ai

switch_start:
li s1, 8
bgt a3, s1, fail
blt a3, zero, fail

j exit

fail:
li a0, 187
j exit

exit:
li a7, 10
ecall


.include "../src/random_AI.asm"