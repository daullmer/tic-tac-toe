.include "../libs/cesplib_rars.asm"
.eqv BORDER_SIZE 5
.eqv SPACE_SIZE 82


draw_board:
li a3 0xffffff # store color white in a3
addi t1, zero, 256 # t1=loop end größe
addi t2, zero, BORDER_SIZE # t2=loop für dicke end größe
addi t3, zero, 2 # 2 linien horizontal

# horizontale linien
li a2, SPACE_SIZE
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
	addi a2, a2, SPACE_SIZE  # nächste linie SPACE_SIZE + 
	addi a2, a2, BORDER_SIZE # BORDER_SIZE pixel weiter zeichnen
	blt a5, t3, hori_line_loop

# vertikale linie
li a1, SPACE_SIZE
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
	addi a1, a1, SPACE_SIZE  # nächste linie SPACE_SIZE + 
	addi a1, a1, BORDER_SIZE # BORDER_SIZE pixel weiter zeichnen
	blt a5, t3, verti_line_loop







#alt


# zahlen schreiben

.include "draw_pixel.asm"