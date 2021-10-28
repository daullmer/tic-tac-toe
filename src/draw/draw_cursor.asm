#.include "cesplib_rars.asm"
# Function to draw rectangle from position x1,y1 to x2,y2 with fill color c
# a3: unsigned integer x1 -- left boundary of rectangle
# a4: unsigned integer y1 -- top boundary of rectangle
# a5: unsigned integer c  -- fill color of rectangle as RGB value
.text
li a3, 1
li a4, 1
li a5, 0x00FF00
jal draw_cursor
li a7, 10
ecall

draw_cursor:
	#STEP x: Save all necessary values to the stack
	# ADD YOUR STEP x CODE HERE

	addi sp, sp, -36
	sw ra, (sp)
	sw s0, 4 (sp)
	sw s1, 8 (sp)
	sw s2, 12 (sp)
	sw s3, 16(sp)
	sw s4, 20(sp)
	# a3-a7 are stored as local variable on the stack
	sw a3, 24 (sp)
	sw a4, 28 (sp)
	sw a5, 32 (sp)

	lw s0, 24 (sp) # int x
	lw s1, 28 (sp) # int y
	li s2, CURSOR_SIZE
	addi s4, zero, 0
	
	_loopy:
	addi s3, zero, 0
		_loopx:
			mv a1, s0
			mv a2, s1
			mv a3, a5
			#STEP x: Move the right value to registers a1-a3 and call draw_pixel
			# ADD YOUR STEP x CODE HERE
			jal draw_pixel
			
			addi s0, s0, 1
			addi s3, s3, 1
			bne s3, s2, _loopx
	addi s1, s1, 1
	addi s4, s4, 1
	lw s0, 24 (sp)
	bne s4, s2, _loopy

	lw ra, (sp)
	lw s0, 4 (sp)
	lw s1, 8 (sp)
	lw s2, 12 (sp)
	lw s3 16(sp)
	lw s4 20(sp)
	# a3-a7 do not need to be restored according to calling convention
	addi sp, sp, 36
	ret
	# ADD YOUR STEP x CODE HERE

.include "draw_pixel.asm"
