.data

# 1 = X    2 = O
board: .word 0 0 0 0 0 0 0 0 0

win_x: .string "X's Win!\n\n"
win_o: .string "O's win!\n\n"
tie: .string "Tie!\n\n"

.text
#######
# MAIN METHOD
#######
main:
jal draw_start
# stores gamemode selector in s9
# 0=>1 Player Mode    1=>2 Player Mode
mv s9, a4
li a4, 0
addi s9, s9, -1
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
	jal checkGameOutcome
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

# Maximale Anzahl an Spielzügen erreicht --> Unentschieden!
j winner_tie

### switch to player 2
to_player2:
	addi t0, t0, 1
	j game_loop.end
	
dr_x:
	jal select_field
	jal draw_x
	j draw_return
dr_o:
	## wenn 1 player mode (s9=0) Zug nicht von Konsole sondern von AI
	beqz s9, dr_AI
	jal select_field
	jal draw_o
	j draw_return
	
dr_AI:
	jal getBlockingMove

	## check if getBlockingMove returned 999 and no move can be blocked right now
	li t2, 999
	beq s5, t2, call.random_ai
	mv a0, s5
	j continue

	call.random_ai:
		jal random_ai

	continue:
	# store a0 in stack
	addi sp, sp, -4
	sw a0, 0(sp)

	# restore original a0 from stack
	lw a0, 0(sp)

	# convert cell to coordinates and draw on screen
	jal cell_to_coordinates
	jal draw_o

	# restore original a0 from stack to a3 (the instructions at draw_return expect the cell at a3)
	lw a3, 0(sp)
	addi sp, sp, 4
	j draw_return


#### Ausgabe am Ende
winner_X:
	la a0, win_x
	li a7, 4
	ecall
	jal winner.x
	j exit
winner_O:
	la a0, win_o
	li a7, 4
	ecall
	jal winner.o
	j exit
winner_tie:
	la a0, tie
	li a7, 4
	ecall
	jal tiescreen
	j exit

## Programm mit Exit Code 0 beenden
exit:
	li a7, 10
	ecall

.include "libs/cesplib_rars.asm"
.include "draw/draw_pixel.asm"
.include "draw/draw_board.asm"
.include "store_in_array.asm"
.include "select_field.asm"
.include "draw/draw_X.asm"
.include "draw/winnerscreen.asm"
.include "draw/draw_O.asm"
.include "check_end_game.asm"
.include "draw/tiescreen.asm"
.include "sound_optimized.asm"
.include "draw/draw_winnerscreen.asm"
.include "draw/draw_blackscreen.asm"
.include "random_AI.asm"
.include "ai.asm"
.include "draw/draw_lines.asm"
.include "draw/draw_startscreen.asm"
