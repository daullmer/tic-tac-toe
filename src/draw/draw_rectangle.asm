#   ___ ___ ___ ___   _    ___ ___ _____ _   _ ___ ___ 
#  / __| __/ __| _ \ | |  | __/ __|_   _| | | | _ \ __|
# | (__| _|\__ \  _/ | |__| _| (__  | | | |_| |   / _| 
#  \___|___|___/_|   |____|___\___| |_|  \___/|_|_\___|
#
# Copyright 2021 Michael J. Klaiber

########################################
#CESP Exercise: Draw Rectangle
########################################


#STEP x: Implement draw_rectangle with the arguments as described below
	# Hint: Don't forget the caller/callee save register conventions

# Function to draw rectangle from position x1,y1 to x2,y2 with fill color c
# a3: unsigned integer x1 -- left boundary of rectangle
# a4: unsigned integer y1 -- top boundary of rectangle
# a5: unsigned integer x2 -- right boundary of rectangle
# a6: unsigned integer y2 -- bottom boundary of rectangle
# a7: unsigned integer c  -- fill color of rectangle as RGB value

draw_rectangle:
	#STEP x: Save all necessary values to the stack
	# ADD YOUR STEP x CODE HERE

	addi sp, sp, -36
	sw ra, (sp)
	sw s0, 4 (sp)
	sw s1, 8 (sp)
	sw s2, 12 (sp)
	# a3-a7 are stored as local variable on the stack
	sw a3, 16 (sp)
	sw a4, 20 (sp)
	sw a5, 24 (sp)
	sw a6, 28 (sp)
	sw a7, 32 (sp)


	lw t0, 16 (sp) # int x
	lw t1, 20 (sp) # int y
	
	_loopy:
		_loopx:
			mv a1, t0
			mv a2, t1
			mv a3, a7
			#STEP x: Move the right value to registers a1-a3 and call draw_pixel
			# ADD YOUR STEP x CODE HERE
			jal draw_pixel
			
			addi t0, t0, 1
			bne t0, a5, _loopx
	addi t1, t1, 1
	lw t0, 16 (sp)
	bne t1, a6, _loopy

	lw ra, (sp)
	lw s0, 4 (sp)
	lw s1, 8 (sp)
	lw s2, 12 (sp)
	# a3-a7 do not need to be restored according to calling convention
	addi sp, sp, 36
	ret
	# ADD YOUR STEP x CODE HERE


