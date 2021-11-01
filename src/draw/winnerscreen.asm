winner.x:
# Create winner screen for player X
# Inputs: None
# Outputs: None
	
	# Save the callee save registers on the stack
	addi sp sp -12
	sw ra (sp)
	sw a1 4(sp)
	sw a2 8(sp)
	
	# Clear the screen
	jal blackscreen
	
	jal draw.winnerscreen

	addi a1 zero 128
	addi a2 zero 132

	jal draw_x

	jal sound
	
	# Callee restore
	lw ra (sp)
	lw a1 4(sp)
	lw a2 8(sp)
	addi sp sp 12
	ret


winner.o:
# Create winnerscreen for player 0
# Inputs: None
# Outputs: None
	
	# Save the callee save registers on the stack
	addi sp sp -12
	sw ra (sp)
	sw a1 4(sp)
	sw a2 8(sp)
	
	# Clear the screen
	jal blackscreen
	
	jal draw.winnerscreen

	addi a1 zero 128
	addi a2 zero 132
	
	jal draw_o

	jal sound
	
	# Callee restore
	lw ra (sp)
	lw a1 4(sp)
	lw a2 8(sp)
	addi sp sp 12
	ret




