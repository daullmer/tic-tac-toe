.include "../../src/libs/cesplib_rars.asm"

utest_draw_winner_X:
jal winner.x

li a7, 10
ecall

.include "../../src/draw/winnerscreen.asm"
.include "../../src/draw/draw_winnerscreen.asm"
.include "../../src/draw/draw_blackscreen.asm"
.include "../../src/draw/draw_X.asm"
.include "../../src/draw/draw_O.asm"
.include "../../src/draw/draw_lines.asm"
.include "../../src/draw/draw_pixel.asm"
.include "../../src/sound_optimized.asm"