

.include "../libs/cesplib_rars.asm"


.text
li a3, 50
li a4, 50
li a5, 30
li a7, 0x157BF1
jal draw_O
li a7, 10
ecall

draw_O:
addi sp, sp, -8
sw a3, 0(sp)
sw ra, 4(sp)

addi a3, a3, -2
addi t0, a3, 5
x_loop:
jal draw_circle
addi a3, a3, 1
ble a3, t0, x_loop

lw a3, 0(sp)

addi a4, a4, -2
addi t0, a4, 5
y_loop:
jal draw_circle
addi a4, a4, 1
ble a4, t0, y_loop

lw ra, 4(sp)
addi sp, sp, 8
ret

.include "draw_circle.asm"
