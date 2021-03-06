tiescreen:
# Create a tie screen
# Inputs: None
# Outputs: None

	# Save the callee save registers on the stack
	addi sp sp -20
	sw ra (sp)
	sw a1, 4 (sp)
	sw a2, 8 (sp)
	sw a3, 12 (sp)
	sw a5, 16 (sp)
	
	# Clear the screen
	jal blackscreen
	
	# Start coordinates
	li a1 86
	li a2 118
	li a3 0xffffff
	
	# Write a 'T' to display
	li a5 24
	jal draw_line_hori
	addi a2 a2 1
	jal draw_line_hori
	addi a1 a1 8
	li a5 31
	jal draw_line_verti
	addi a1 a1 1
	jal draw_line_verti
	addi a1 a1 1
	jal draw_line_verti
	addi a1 a1 1
	jal draw_line_verti
	addi a1 a1 1
	jal draw_line_verti
	addi a1 a1 1
	jal draw_line_verti
	addi a1 a1 1
	jal draw_line_verti
	addi a1 a1 1
	jal draw_line_verti
	
	# Write a 'I' to display
	addi a1 a1 17
	addi a2 a2 -1
	addi a5 a5 1
	jal draw_line_verti
	addi a1 a1 1
	jal draw_line_verti
	addi a1 a1 1
	jal draw_line_verti
	addi a1 a1 1
	jal draw_line_verti
	addi a1 a1 1
	jal draw_line_verti
	addi a1 a1 1
	jal draw_line_verti
	addi a1 a1 1
	jal draw_line_verti
	addi a1 a1 1
	jal draw_line_verti
	
	# Write a 'E' to display
	addi a1 a1 9
	jal draw_line_verti
	addi a1 a1 1
	jal draw_line_verti
	addi a1 a1 1
	jal draw_line_verti
	addi a1 a1 1
	jal draw_line_verti
	addi a1 a1 1
	jal draw_line_verti
	addi a1 a1 1
	jal draw_line_verti
	addi a1 a1 1
	jal draw_line_verti
	addi a1 a1 1
	jal draw_line_verti
	
	li a5 12
	jal draw_line_hori
	addi a2 a2 1
	jal draw_line_hori
	
	addi a2 a2 14
	jal draw_line_hori
	addi a2 a2 1
	jal draw_line_hori
	
	addi a2 a2 14
	jal draw_line_hori
	addi a2 a2 1
	jal draw_line_hori
	
	# Write a '!' to display
	addi a1 a1 20
	addi a2 a2 -31
	li a5 20
	jal draw_line_verti
	addi a1 a1 1
	jal draw_line_verti
	addi a1 a1 1
	jal draw_line_verti
	addi a1 a1 1
	jal draw_line_verti
	addi a1 a1 1
	jal draw_line_verti
	addi a1 a1 1
	jal draw_line_verti
	addi a1 a1 1
	jal draw_line_verti
	addi a1 a1 1
	jal draw_line_verti
	
	addi a2 a2 24
	li a5 8
	jal draw_line_verti
	addi a1 a1 -1
	jal draw_line_verti
	addi a1 a1 -1
	jal draw_line_verti
	addi a1 a1 -1
	jal draw_line_verti
	addi a1 a1 -1
	jal draw_line_verti
	addi a1 a1 -1
	jal draw_line_verti
	addi a1 a1 -1
	jal draw_line_verti
	addi a1 a1 -1
	jal draw_line_verti
	
	# Callee restore
	lw ra (sp)
	lw a1, 4 (sp)
	lw a2, 8 (sp)
	lw a3, 12 (sp)
	lw a5, 16 (sp)
	
	addi sp sp 20
	ret



