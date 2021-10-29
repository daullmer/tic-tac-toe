.data

board: .word 0 0 0 0 0 0 0 0 0

win_x: .string "X's Win!"
win_o: .string "O's win!"
tie: .string "Tie!"

.text
# 1 = X    2 = O
# adresse an der der speicherstand gespeichert ist



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
	la a0, board
	# get input
	jal select_field
	
	# draw x or o on board
	beq t0, s10, dr_x
	beq t0, s11, dr_o
	
	draw_return: # after drawing on display continue here
	# save input to array
	la a1, board		# array start address
	mv a2, a3			# cell number from input
	mv a3, t0			# current player
	jal store_in_array
	
	# check if someone won
	la a0, board	# array start address
	jal checkGameOutcome # TODO callee save register
	beq a0, s10, winner_X
	beq a0, s11, winner_O
	
	# remove one try
	addi t1, t1, -1
	
	# switch current player
	beq t0, s10, to_player2 # if current player is 1 and next player should be 2, jump
	addi t0, t0, -1 # change from player 2 to player 1
	
	# jump back to game_loop of we still have tries left
	game_loop.end:
	bnez t1, game_loop
# Unentschieden
la a0, tie
li a7, 4
ecall
# Exit
exit:
li a7, 10
ecall

### switch to player 2
to_player2:
	addi t0, t0, 1
	j game_loop.end
	
dr_x:
	jal draw_x
	j draw_return
dr_o:
	jal draw_o
	j draw_return

winner_X:
	la a0, win_x
	li a7, 4
	ecall
	j exit
winner_O:
	la a0, win_o
	li a7, 4
	ecall
	j exit

.include "libs/cesplib_rars.asm"
.include "draw/draw_pixel.asm"
.include "draw/draw_board.asm"
.include "store_in_array.asm"
.include "select_field.asm"
.include "draw/draw_X.asm"
.include "draw/draw_O.asm"
.include "check_end_game.asm"
