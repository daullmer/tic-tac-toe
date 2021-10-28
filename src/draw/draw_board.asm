#######
# DRAW GAME BOARD INCLUDING NUMBERS
# ------------
# inputs: none
#######
draw_board:

# save variables
addi sp, sp, -36
sw ra 32(sp)
sw a1 28(sp)
sw a2 24(sp)
sw a3 20(sp)
sw a4 16(sp)
sw a5 12(sp)
sw t1 8(sp)
sw t2 4(sp)
sw t3 0(sp)


li a3 0xffffff # store color white in a3
addi t1, zero, DISPLAY_WIDTH # t1=loop end größe
addi t2, zero, BORDER_SIZE # t2=loop für dicke end größe
addi t3, zero, 2 # 2 linien horizontal

# horizontale linien
li a2, CELL_SIZE
li a5, 0 # number of current line
hori_line_loop:
	li a4, 0 # a4 current line width
	line_height_loop:
		li a1, 0
		hori_hori_loop:
			jal draw_pixel
			addi a1, a1, 1
			blt a1, t1, hori_hori_loop
		addi a4, a4, 1
		addi a2, a2, 1
		blt a4, t2, line_height_loop
	addi a5, a5, 1
	addi a2, a2, CELL_SIZE  # nächste linie CELL_SIZE pixel weiter zeichnen
	blt a5, t3, hori_line_loop

# vertikale linien
li a1, CELL_SIZE
li a5, 0 # number of current line
verti_line_loop:
	li a4, 0 # a4 current line width
	line_width_loop:
		li a2, 0
		verti_verti_loop:
			jal draw_pixel
			addi a2, a2, 1
			blt a2, t1, verti_verti_loop
		addi a4, a4, 1
		addi a1, a1, 1
		blt a4, t2, line_width_loop
	addi a5, a5, 1
	addi a1, a1, CELL_SIZE  # nächste linie CELL_SIZE pixel weiter zeichnen
	blt a5, t3, verti_line_loop

jal draw_board_numbers

# restore variables
lw ra 32(sp)
lw a1 28(sp)
lw a2 24(sp)
lw a3 20(sp)
lw a4 16(sp)
lw a5 12(sp)
lw t1 8(sp)
lw t2 4(sp)
lw t3 0(sp)
addi sp, sp, 36
ret

.include "draw_board_numbers.asm"
