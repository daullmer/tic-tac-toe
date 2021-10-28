.text
# 1 = X    2 = O
# adresse an der der speicherstand gespeichert ist
.eqv board 0x10008000

#######
# MAIN METHOD
#######
main:
# Board aufbauen
jal draw_board
# initialize current player with 1 (=X)
li t0, 1
# initialize number of tries to 9
li t1, 9
## constants form player change
li s10, 1
li s11, 2

game_loop:
	# get input
	jal input
	# draw x or o on board
	jal draw_x
	# save input to array
	li a1, board		# array start address
	mv a2, a0		# cell number from input
	mv a3, t0		# current player
	jal store_in_array
	# check if someone won
	
	# remove one try
	addi t1, t1, -1
	# switch current player
	beq t0, s10, to_player1 # if current player is 2 and next player should be 1, jump
	addi t0, t0, 1 # change from player 1 to player 2
	
	# jump back to game_loop of we still have tries left
	game_loop.end:
	bnez t1, game_loop

# Exit
exit:
li a7, 10
ecall

### switch to player 1
to_player1:
	addi t0, t0, -1
	j game_loop.end


.include "libs/cesplib_rars.asm"
.include "draw/draw_pixel.asm"
.include "draw/draw_board.asm"
.include "store_in_array.asm"
.include "select_field.asm"
.include "draw/draw_X.asm"
#.include "check_end_game.asm"