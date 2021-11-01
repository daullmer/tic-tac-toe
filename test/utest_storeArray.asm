.data
board: .word 0 0 0 0 0 0 0 0 0

.text

la a1, board
li a2, 0
li a3, 1
jal store_in_array

li a7, 10
ecall


.include "../src/store_in_array.asm"