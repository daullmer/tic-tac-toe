.include "../../src/libs/cesplib_rars.asm"

utest_draw_x:

li a1, 41
li a2, 41
jal draw_x

li a7, 10
ecall

.include "../../src/draw/draw_X.asm"
.include "../../src/draw/draw_pixel.asm"
