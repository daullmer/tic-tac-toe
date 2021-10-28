.include "../libs/cesplib_rars.asm"

.text

jal interactive_cursor
li a7, 10
ecall


interactive_cursor:


addi sp, sp, -44
sw ra, 0(sp)
sw a1, 4(sp)
sw a2 8(sp)
sw a3 12(sp)
sw a4 16(sp)
sw a5 20(sp)

li a3, 37 # x1 -- left boundary of cursor
li a4, 37 # y1 -- top boundary of cursor
li a5, 0x00ff00 # color

sw a3 24(sp)
sw a4 28(sp)
sw a5 32(sp)

sw s0 36(sp)
sw s1 40(sp)
sw s2 44(sp)
sw s3 48(sp)

li s1, DISPLAY_WIDTH # initialize register s1 with the predefined display width
li s2, DISPLAY_HEIGHT # initialize register s2 with the predefined display height
addi s0, zero, 2
li s3, CURSOR_SIZE 
div s3, s3, s0


li s0, KEYBOARD_ADDDRESS # initialize register s0 with the predefined keyboard address

main.loop:
lw a3, 24 (sp)
lw a4, 28 (sp)
lw a5, 32(sp)

lw t0, 0(s0)
beq t0, zero switch.end
lw t0, 4(s0)

switch.start:

	switch.w:
	li t1, 'w'
  	bne t0, t1, switch.s
  	
  	addi a4, a4, -87
  	
  	if_w:
  	bgez a4, if_w_not
  	addi a4, zero, 210
  	if_w_not:
  	beq zero, zero switch.end
  	
  	switch.s:
  	li t1, 's'
  	bne t0, t1 switch.a
  
  	# cursor springt ein Feld nach unten
  	addi a4, a4, 87
  
  	# cursor springt vom untersten Feld zurück ins oberste
  	if_s:
  	blt a4, s2, if_s_not
  	addi a4, zero, 37
  
  	if_s_not:
  
  	beq zero, zero switch.end
  	
  	
  	switch.a:
  	li t1, 'a'
  	bne t0, t1 switch.d
  
  	# cursor sprint ein Feld nach links
  	addi a3, a3, -87
  
  	# cursor springt vom ganz linke Feld ins ganz rechts
  	if_a:
  	bgez a3, if_a_not
  	addi a3, zero, 211
  	
  	if_a_not:
  
  	beq zero, zero switch.end
  
  	switch.d:
  	li t1, 'd'
 	bne t0, t1 switch_x
  
  	# cursor sprint ein Feld nach rechts
  	addi a3, a3, 87
  
  
  	# cursor sprint vom ganz rechten Feld zurück ins ganz linke
  	if_d:
  	ble  a3, s1, if_d_not
  	addi a3, zero, 37
  	
  	if_d_not:
  	beq zero, zero switch.end
  
  	switch_x:
  	li t1 'x'
  	beq t0, t1, final_end

switch.end:
  #Store changed variables
  sw a3,  24 (sp)
  sw a4,  28 (sp)

# clear key vector
sw zero, 0(s0)

# draw rectangle
jal draw_cursor
  	
li a0, 20
jal cesp_sleep


# Remove rectangle again by drawing a black rectangle of the same dimensions
lw a3,  24 (sp)
lw a4,  28 (sp)
li a5, 0
jal draw_cursor

j main.loop

final_end:

add a1, zero, a3
add a2, zero, a4
add a1, a1, s3
add a2, a2, s3
li a3, 0xFF0000

#jal draw_x

lw ra, 0(sp)
lw a1, 4(sp)
lw a2 8(sp)
lw a3 12(sp)
lw a4 16(sp)
lw a5 20(sp)

lw s0 36(sp)
lw s1 40(sp)
lw s2 44(sp)
lw s3 48(sp)
addi sp sp 44


ret


.include "draw_cursor.asm"
#.include "draw_X.asm"
