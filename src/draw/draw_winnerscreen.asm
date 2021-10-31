
.text
li a3 0xffffff
jal draw.winnerscreen
li a7 10
ecall

draw.winnerscreen:
addi sp sp -20
sw ra (sp)
sw a1 4(sp)
sw a2 8(sp)
sw a3 12(sp)
sw a5 16(sp)


li a3 0xffffff
li a1 102
li a2 170
jal winnertext

li a1 68
li a2 60
jal draw_pokal

li a1 116
li a2 60
jal draw_pokal

li a1 164
li a2 60
jal draw_pokal


lw ra (sp)
lw a1 4(sp)
lw a2 8(sp)
lw a3 12(sp)
lw a5 16(sp)
addi sp sp 20
ret

draw_pokal:
addi sp sp -20
sw ra (sp)
sw a1 4(sp)
sw a2 8(sp)
sw a3 12(sp)
sw a5 16(sp)

li a3 0xefd361

li a5 20
jal draw_line_hori
addi a2 a2 1
jal draw_line_hori
addi a2 a2 1
jal draw_line_hori
addi a2 a2 1
jal draw_line_hori

li a5 17
jal draw_line_verti
addi a1 a1 1
jal draw_line_verti
addi a1 a1 1
jal draw_line_verti
addi a1 a1 1
jal draw_line_verti

addi a1 a1 1
addi a2 a2 1
li a3 0xffeccd
li a5 8
jal draw_line_verti
addi a1 a1 1
jal draw_line_verti
addi a1 a1 1
jal draw_line_verti
addi a1 a1 1
jal draw_line_verti
li a5 5
jal draw_line_hori
addi a2 a2 1
jal draw_line_hori
addi a2 a2 1
jal draw_line_hori
addi a2 a2 1
jal draw_line_hori

li a3 0xefd361
addi a2 a2 1
addi a1 a1 1
li a5 12
jal draw_line_verti
addi a1 a1 1
jal draw_line_verti
addi a1 a1 1
jal draw_line_verti
addi a1 a1 1
jal draw_line_verti

addi a1 a1 1
addi a2 a2 -4
li a5 16
li a3 0xefd361
jal draw_line_verti
addi a1 a1 1
jal draw_line_verti
addi a1 a1 1
jal draw_line_verti
addi a1 a1 1
jal draw_line_verti
addi a1 a1 1
jal draw_line_verti
addi a1 a1 1
jal draw_line_verti
addi a1 a1 1
jal draw_line_verti
addi a1 a1 1
jal draw_line_verti

addi a1 a1 -15
addi a2 a2 8
li a5 8
jal draw_line_verti
addi a1 a1 1
jal draw_line_verti
addi a1 a1 1
jal draw_line_verti
addi a1 a1 1
jal draw_line_verti

addi a2 a2 8
addi a1 a1 -3
li a5 12
jal draw_line_hori
addi a2 a2 1
jal draw_line_hori
addi a2 a2 1
jal draw_line_hori
addi a2 a2 1
jal draw_line_hori

addi a2 a2 1
addi a1 a1 4
li a5 4
jal draw_line_hori
addi a2 a2 1
jal draw_line_hori
addi a2 a2 1
jal draw_line_hori
addi a2 a2 1
jal draw_line_hori

li a3 0xd5b950
addi a2 a2 1
li a5 8
jal draw_line_verti
addi a1 a1 1
jal draw_line_verti
addi a1 a1 1
jal draw_line_verti
addi a1 a1 1
jal draw_line_verti

addi a2 a2 -4
addi a5 a5 4
addi a1 a1 1
jal draw_line_verti
addi a1 a1 1
jal draw_line_verti
addi a1 a1 1
jal draw_line_verti
addi a1 a1 1
jal draw_line_verti

addi a2 a2 -4
addi a1 a1 1
li a5 4
jal draw_line_verti
addi a1 a1 1
jal draw_line_verti
addi a1 a1 1
jal draw_line_verti
addi a1 a1 1
jal draw_line_verti

addi a1 a1 1
addi a2 a2 -20
li a5 20
jal draw_line_verti
addi a1 a1 1
jal draw_line_verti
addi a1 a1 1
jal draw_line_verti
addi a1 a1 1
jal draw_line_verti

addi a1 a1 1
addi a2 a2 8
li a5 8
jal draw_line_hori
addi a2 a2 1
jal draw_line_hori
addi a2 a2 1
jal draw_line_hori
addi a2 a2 1
jal draw_line_hori

addi a1 a1 4
jal draw_line_verti
addi a1 a1 1
jal draw_line_verti
addi a1 a1 1
jal draw_line_verti
addi a1 a1 1
jal draw_line_verti

addi a1 a1 -7
addi a2 a2 5
jal draw_line_hori
addi a2 a2 1
jal draw_line_hori
addi a2 a2 1
jal draw_line_hori
addi a2 a2 1
jal draw_line_hori

addi a1 a1 -20
addi a2 a2 13
li a5 16
jal draw_line_hori
addi a2 a2 1
jal draw_line_hori
addi a2 a2 1
jal draw_line_hori
addi a2 a2 1
jal draw_line_hori

addi a1 a1 -12
addi a2 a2 -16
li a3 0xefd361
li a5 8
jal draw_line_hori
addi a2 a2 -1
jal draw_line_hori
addi a2 a2 -1
jal draw_line_hori
addi a2 a2 -1
jal draw_line_hori

addi a2 a2 -5
jal draw_line_hori
addi a2 a2 -1
jal draw_line_hori
addi a2 a2 -1
jal draw_line_hori
addi a2 a2 -1
jal draw_line_hori

jal draw_line_verti
addi a1 a1 1
jal draw_line_verti
addi a1 a1 1
jal draw_line_verti
addi a1 a1 1
jal draw_line_verti

addi a1 a1 29
li a5 4
jal draw_line_verti
addi a1 a1 1
jal draw_line_verti
addi a1 a1 1
jal draw_line_verti
addi a1 a1 1
jal draw_line_verti


lw ra (sp)
lw a1 4(sp)
lw a2 8(sp)
lw a3 12(sp)
lw a5 16(sp)
addi sp sp 20
ret

winnertext:

addi sp sp -4
sw ra (sp)


li a5 15

jal draw_line_verti

addi a1 a1 1

jal draw_line_verti

addi a1 a1 1
addi a2 a2 15
li a5 2

jal draw_line_verti

addi a1 a1 1
jal draw_line_verti

addi a1 a1 1
addi a2 a2 -7
li a5 7
jal draw_line_verti

addi a1 a1 1
jal draw_line_verti

addi a1 a1 1
addi a2 a2 7
li a5 2
jal draw_line_verti

addi a1 a1 1
jal draw_line_verti

addi a2 a2 -15
addi a1 a1 1
li a5 17
jal draw_line_verti 

addi a1 a1 1
jal draw_line_verti

li a5 15
addi a1 a1 1
jal draw_line_verti

addi a1 a1 1
jal draw_line_verti


#I

addi a1 a1 5
li a5 17
jal draw_line_verti

addi a1 a1 1
jal draw_line_verti

addi a1 a1 1
jal draw_line_verti

addi a1 a1 1
jal draw_line_verti


#N

addi a1 a1 5
jal draw_line_verti

addi a1 a1 1
jal draw_line_verti

addi a1 a1 1
addi a2 a2 2
li a5 2
jal draw_line_verti

addi a1 a1 1
jal draw_line_verti

addi a1 a1 1
addi a2 a2 2
jal draw_line_verti

addi a1 a1 1
jal draw_line_verti

addi a1 a1 1
addi a2 a2 2
jal draw_line_verti

addi a1 a1 1
jal draw_line_verti


addi a1 a1 1
addi a2 a2 -6
li a5 17
jal draw_line_verti

addi a1 a1 1
jal draw_line_verti

addi a1 a1 1
jal draw_line_verti

addi a1 a1 1
jal draw_line_verti



#S
addi a1 a1 5
addi a2 a2 2
li a5 5
jal draw_line_verti

addi a1 a1 1
jal draw_line_verti

addi a1 a1 1
addi a2 a2 -2
li a5 8
jal draw_line_hori

addi a2 a2 1
jal draw_line_hori

li a5 6
jal draw_line_verti

addi a1 a1 1
jal draw_line_verti

addi a2 a2 1
addi a1 a1 5
li a5 4
jal draw_line_hori

addi a2 a2 1
jal draw_line_hori

addi a1 a1 -4
addi a2 a2 4
jal draw_line_hori

addi a2 a2 1
jal draw_line_hori

addi a1 a1 4
addi a2 a2 1
li a5 8
jal draw_line_verti

addi a1 a1 1
jal draw_line_verti

addi a1 a1 1
li a5 6
jal draw_line_verti

addi a1 a1 1
jal draw_line_verti

addi a1 a1 -9
addi a2 a2 7
li a5 8
jal draw_line_hori

addi a2 a2 -1
jal draw_line_hori

addi a1 a1 -2
addi a2 a2 -2
li a5 4
jal draw_line_hori

addi a2 a2 1
jal draw_line_hori




lw ra (sp)
addi sp sp 4
ret




draw_line_verti:
#input a1 a2 a5

addi sp sp -20
sw ra (sp)
sw a1 4(sp)
sw a2 8(sp)
sw a5 12(sp)
sw t2 16(sp)


li t2 0

for_loop:
jal draw_pixel
addi a2 a2 1
addi t2 t2 1
blt t2 a5 for_loop

lw ra (sp)
lw a1 4(sp)
lw a2 8(sp)
lw a5 12(sp)
lw t2 16(sp)
addi sp sp 20
ret



draw_line_hori:
#input a1 a2 a5

addi sp sp -20
sw ra (sp)
sw a1 4(sp)
sw a2 8(sp)
sw a5 12(sp)
sw t2 16(sp)

li t2 0

for_loop_h:
jal draw_pixel
addi a1 a1 1
addi t2 t2 1
blt t2 a5 for_loop_h

lw ra (sp)
lw a1 4(sp)
lw a2 8(sp)
lw a5 12(sp)
lw t2 16(sp)
addi sp sp 20
ret



