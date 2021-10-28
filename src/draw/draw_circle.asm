#   ___ ___ ___ ___   _    ___ ___ _____ _   _ ___ ___ 
#  / __| __/ __| _ \ | |  | __/ __|_   _| | | | _ \ __|
# | (__| _|\__ \  _/ | |__| _| (__  | | | |_| |   / _| 
#  \___|___|___/_|   |____|___\___| |_|  \___/|_|_\___|
#
# Copyright 2021 Michael J. Klaiber



draw_circle:
# Inputs
#------------------
# a3: x coordinate
# a4: y coordinate
# a5: radius in pixels
# a7: color

# s1: x
# s2: y
# s3: d

addi sp, sp, -40
sw a3,  (sp)
sw a4, 4(sp)
sw a5, 8(sp)
sw a7, 12(sp)
sw ra, 16(sp)
sw s1, 20(sp) 
sw s2, 24(sp)
sw s3, 28(sp)
sw t0, 32(sp)
sw ra, 36(sp)

li a5, 30


mv s1, a5 # x = r
li s2, 0 # y = 0
sub s3, zero, a5 # d = -r
_loop0:
	slli t0, s2, 2
	addi t0, t0, 1
	add s3, s3, t0 # d = d + 2*y + 1
	addi s2, s2, 1 # y = y + 1
	ble s3, zero, _lesseq	
		slli t0, s1, 2
		sub s3, s3, t0 
		addi s3, s3, 2 # d = d - 2*x + 2
		addi s1, s1, -1
	_lesseq:		

	#------------------------
	lw a3,  (sp)
	lw a4, 4(sp)
	lw a5, 8(sp)
	lw a7, 12(sp)
	
	add a3, a3, s1 # xc + x
	add a4, a4, s2 # yc + y
	jal draw_pixel
	#----------------------
	lw a3,  (sp)
	lw a4, 4(sp)
	lw a5, 8(sp)
	lw a7, 12(sp)

	sub a3, a3, s1 # xc - x
	add a4, a4, s2 # yc + y
	jal draw_pixel
	#----------------------	
	lw a3,  (sp)
	lw a4, 4(sp)
	lw a5, 8(sp)
	lw a7, 12(sp)

	add a3, a3, s1 # xc + x
	sub a4, a4, s2 # yc - y
	jal draw_pixel
	#----------------------
	lw a3,  (sp)
	lw a4, 4(sp)
	lw a5, 8(sp)
	lw a7, 12(sp)
	
	sub a3, a3, s1 # xc - x
	sub a4, a4, s2 # yc - y
	jal draw_pixel
	
	#----------------------
	lw a3,  (sp)
	lw a4, 4(sp)
	lw a5, 8(sp)
	lw a7, 12(sp)

	add a3, a3, s2 # xc + y
	add a4, a4, s1 # yc + x
	jal draw_pixel
	#----------------------		
	lw a3,  (sp)
	lw a4, 4(sp)
	lw a5, 8(sp)
	lw a7, 12(sp)
	
	sub a3, a3, s2 # xc - y
	add a4, a4, s1 # yc + x
	jal draw_pixel

	#----------------------	
	lw a3,  (sp)
	lw a4, 4(sp)
	lw a5, 8(sp)
	lw a7, 12(sp)
	
	
	add a3, a3, s2 # xc + y
	sub a4, a4, s1 # yc - x
	jal draw_pixel

	#----------------------	
	lw a3,  (sp)
	lw a4, 4(sp)
	lw a5, 8(sp)
	lw a7, 12(sp)
	
	sub a3, a3, s2 # xc - y
	sub a4, a4, s1 # yc - x
	jal draw_pixel

_end_loop:
ble s2,s1 _loop0
	
# Restore the callee-save reisters
lw a3,  (sp)
lw a4, 4(sp)
lw a5, 8(sp)
lw a7, 12(sp)
lw ra, 16(sp)
lw s1, 20(sp) 
lw s2, 24(sp)
lw s3, 28(sp)
lw t0, 32(sp)
lw ra, 36(sp)
addi sp, sp, 40
ret


draw_pixel:
# Creates colored pixel at position (x,y)  

# Inputs
#    a3: x
#    a4: y
#    a7: color
# Outputs: None

	# This is a leaf node where only caller save registers are used
	# --> No stack push/pop necessary

	# Calculate address
	li t3, DISPLAY_ADDRESS
	li t4, DISPLAY_WIDTH
	mul t6, a4, t4
	add t6, t6, a3
	slli, t6, t6, 2 # address *4
	add t6, t6, t3

	
	sw a7, (t6)
	ret
