.include "../../src/libs/cesplib_rars.asm"

utest_draw_pixel:
	li a1, 45
	li a2, 40
	li a3, 0x8db527
	jal draw_pixel

	li a1, 47
	li a2, 40
	li a3, 0x8db527
	jal draw_pixel	
	

	li a1, 100
	li a2, 100
	li a3, 0x8db527
	jal draw_pixel
	
	

li a7, 10
ecall

.include "../../src/draw/draw_pixel.asm"
