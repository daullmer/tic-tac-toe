
draw_line_verti:
# Draw vertical line to display
# a1: x coordinate
# a2: y coordinate
# a5: length

	addi sp sp -20
	sw ra (sp)
	sw a1 4(sp)
	sw a2 8(sp)
	sw a5 12(sp)
	sw t2 16(sp)


	li t2 0

	for_loop:
		jal draw_pixel
		addi a2 a2 1
		addi t2 t2 1
		blt t2 a5 for_loop

	lw ra (sp)
	lw a1 4(sp)
	lw a2 8(sp)
	lw a5 12(sp)
	lw t2 16(sp)
	addi sp sp 20
	ret



draw_line_hori:
# Draw horizontal line to display
# a1: x coordinate
# a2: y coordinate
# a5: length

	addi sp sp -20
	sw ra (sp)
	sw a1 4(sp)
	sw a2 8(sp)
	sw a5 12(sp)
	sw t2 16(sp)

	li t2 0

	for_loop_h:
		jal draw_pixel
		addi a1 a1 1
		addi t2 t2 1
		blt t2 a5 for_loop_h

	lw ra (sp)
	lw a1 4(sp)
	lw a2 8(sp)
	lw a5 12(sp)
	lw t2 16(sp)
	addi sp sp 20
	ret

