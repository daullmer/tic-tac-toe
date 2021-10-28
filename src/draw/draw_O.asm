

.text

# Inputs
#----------------------
#    a1: x
#    a2: y
#    a3: color
# Outputs: None


li a1, 50
li a2, 50

li a3, 0x0000FF
jal draw_O
li a7, 10
ecall

draw_O:
mv a3, a1
mv a4, a2
li a7, 0x0000FF # translate values

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
