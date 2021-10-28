
.text

li a1, 50
li a2, 50
li a3, 0xFF0000
jal draw_x
li a7, 10
ecall

draw_x:
# Inputs
#----------------------
#    a1: x
#    a2: y
#    a3: color
# Outputs: None


	addi sp, sp, -24
	sw s0, 0 (sp)
	sw s1, 4 (sp)
	sw s2, 8 (sp)
	sw a1, 12(sp)
	sw a2, 16(sp)
	sw ra, 20(sp)
	
	li a3, 0xFF0000
	
	li s0, DISPLAY_ADDRESS
	li s1, DISPLAY_WIDTH
	
	addi a1, a1, -2
	addi t0, a1, 5 #x-width
	
	addi t3, zero, 25 #x-elongation
	sub t1, a2, t3 #x top limit
	add t2, a2, t3 #x bottom limit
		
	
	x_width:
		sw a1, 12(sp)
		
		#top-left:
		top_left_loop:
			jal draw_pixel
			addi a2, a2, -1
			addi a1, a1, -1
			bge a2, t1, top_left_loop
		lw a1, 12(sp)
		lw a2, 16(sp)
		
		#top-right:
		top_right_loop:
			jal draw_pixel
			addi a2, a2, -1
			addi a1, a1, 1
			bge a2, t1, top_right_loop
		lw a1, 12(sp)
		lw a2, 16(sp)
		
		#bottom-left:
		bottom_left_loop:
			jal draw_pixel
			addi a2, a2, 1
			addi a1, a1, -1
			ble a2, t2, bottom_left_loop
		lw a1, 12(sp)
		lw a2, 16(sp)
		
		#bottom-right:
		bottom_right_loop:
			jal draw_pixel
			addi a2, a2, 1
			addi a1, a1, 1
			ble a2, t2, bottom_right_loop
		lw a1, 12(sp)
		lw a2, 16(sp)
		
		addi a1, a1, 1
		ble a1, t0, x_width

	
	lw s0, 0(sp)
	lw s1, 4(sp)
	lw s2, 8(sp)
	lw ra, 20(sp)
	addi sp, sp, 24
	ret
