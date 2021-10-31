.include "../libs/cesplib_rars.asm"

.text
jal winner.x

li a7 10
ecall


winner.x:

addi sp sp -12
sw ra (sp)
sw a1 4(sp)
sw a2 8(sp)

jal draw.winnerscreen

addi a1 zero 128
addi a2 zero 132

jal draw_x

jal sound

lw ra (sp)
lw a1 4(sp)
lw a2 8(sp)
addi sp sp 12
ret


winner.o:

addi sp sp -12
sw ra (sp)
sw a1 4(sp)
sw a2 8(sp)

jal draw.winnerscreen

addi a1 zero 128
addi a2 zero 132

jal draw_o

jal sound

lw ra (sp)
lw a1 4(sp)
lw a2 8(sp)
addi sp sp 12
ret

.include "../sound_optimized.asm"
.include "draw_X.asm"
.include "draw_O.asm"
.include "draw_winnerscreen.asm"
.include "draw_pixel.asm"
