.include "../../src/libs/cesplib_rars.asm"

utest_draw_board:
jal draw_board

li a7, 10
ecall

.include "../../src/draw/draw_board.asm"
.include "../../src/draw/draw_pixel.asm"
