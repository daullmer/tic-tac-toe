.include "../../src/libs/cesplib_rars.asm"

utest_draw_o:

li a1, 41
li a2, 41
jal draw_o

li a7, 10
ecall

.include "../../src/draw/draw_O.asm"
.include "../../src/draw/draw_pixel.asm"
