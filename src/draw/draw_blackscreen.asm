
blackscreen:
# Creates a black rectangle to clear the screen
# Inputs: None
# Outputs: None
	
	# Save the callee save registers on the stack
	addi sp sp -24
	sw ra (sp)
	sw a3, 4 (sp)
	sw a4, 8 (sp)
	sw a5, 12 (sp)
	sw a6, 16 (sp)
	sw a7, 20 (sp)
	
	# Coordinates for the black rectangle
	addi a3 zero 0
	addi a4 zero 0
	addi a5 zero 256
	addi a6 zero 256
	li a7 0x000000
	
	jal draw_rectangle
	
	# Callee restore
	lw ra (sp)
	lw a3, 4 (sp)
	lw a4, 8 (sp)
	lw a5, 12 (sp)
	lw a6, 16 (sp)
	lw a7, 20 (sp)
	addi sp sp 24
	ret
	
.include "draw_rectangle.asm"
