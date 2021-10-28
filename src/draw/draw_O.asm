.text
li a1, 50
li a2, 50

li a3, 0x0000FF
jal draw_o
li a7, 10
ecall

#######
# DRAW O TO DISPLAY
# ------------
# inputs: a1 - x center coordinate
#         a2 - y center coordinate
#######
draw_o:
	addi sp, sp, -24
	sw a3, 0(sp)
	sw a4, 4(sp)
	sw a7, 8(sp)
	sw t0, 12(sp)
	sw ra, 16(sp)
	
	mv a3, a1
	mv a4, a2
	li a7, 0x0000FF # translate values

	sw a3, 20(sp) # save a3 again after moving value from a1 to a3


	addi a3, a3, -2
	addi t0, a3, 5
	x_loop:
		jal draw_circle
		addi a3, a3, 1
		ble a3, t0, x_loop

	lw a3, 20(sp) # load second saved a3

	addi a4, a4, -2
	addi t0, a4, 5
	
	y_loop:
		jal draw_circle
		addi a4, a4, 1
		ble a4, t0, y_loop

	lw a3, 0(sp)
	lw a4, 4(sp)
	lw a7, 8(sp)
	lw t0, 12(sp)
	lw ra, 16(sp)
	addi sp, sp, 24
	ret

.include "draw_circle.asm"
