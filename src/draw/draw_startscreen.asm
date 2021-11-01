

.text

jal draw_start
li a7, 10
ecall

draw_start:
addi sp sp -24
sw a0 0(sp)
sw a1 4(sp)
sw a2 8(sp)
sw a3 12(sp)
sw a5 16(sp)
sw ra 20(sp)


li a1, 50
li a2, 50
li a3, 0xffffff


#C
addi a1 a1 12
li a5 17
jal draw_line_verti

addi a1 a1 1
jal draw_line_verti

addi a1 a1 1
jal draw_line_verti

addi a1 a1 1
jal draw_line_verti

addi a1 a1 1
addi a2 a2 16
li a5 8
jal draw_line_hori

addi a2 a2 -1
jal draw_line_hori

addi a2 a2 -14
jal draw_line_hori

addi a2 a2 -1
jal draw_line_hori


#H
addi a1 a1 12
li a5 17
jal draw_line_verti

addi a1 a1 1
jal draw_line_verti

addi a1 a1 1
jal draw_line_verti

addi a1 a1 1
jal draw_line_verti


addi a1 a1 1
addi a2 a2 6
li a5 4
jal draw_line_hori

addi a2 a2 1
jal draw_line_hori

addi a1 a1 4
addi a2 a2 -7
li a5 17
jal draw_line_verti

addi a1 a1 1
jal draw_line_verti

addi a1 a1 1
jal draw_line_verti

addi a1 a1 1
jal draw_line_verti

#O
addi a1 a1 4
li a5 17
jal draw_line_verti

addi a1 a1 1
jal draw_line_verti

addi a1 a1 1
jal draw_line_verti

addi a1 a1 1
addi a2 a2 16
li a5 9
jal draw_line_hori

addi a2 a2 -1
jal draw_line_hori

addi a2 a2 -14
jal draw_line_hori

addi a2 a2 -1
jal draw_line_hori

addi a1 a1 5
li a5 17
jal draw_line_verti

addi a1 a1 1
jal draw_line_verti

addi a1 a1 1
jal draw_line_verti

addi a1 a1 1
jal draw_line_verti

#O
addi a1 a1 4
li a5 17
jal draw_line_verti

addi a1 a1 1
jal draw_line_verti

addi a1 a1 1
jal draw_line_verti

addi a1 a1 1
addi a2 a2 16
li a5 9
jal draw_line_hori

addi a2 a2 -1
jal draw_line_hori

addi a2 a2 -14
jal draw_line_hori

addi a2 a2 -1
jal draw_line_hori

addi a1 a1 5
li a5 17
jal draw_line_verti

addi a1 a1 1
jal draw_line_verti

addi a1 a1 1
jal draw_line_verti

addi a1 a1 1
jal draw_line_verti

#S
addi a1 a1 4
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

#E
addi a1 a1 15
addi a2 a2 -14
li a5 17
jal draw_line_verti

addi a1 a1 1
jal draw_line_verti

addi a1 a1 1
jal draw_line_verti


addi a1 a1 1
addi a2 a2 16
li a5 8
jal draw_line_hori

addi a2 a2 -1
jal draw_line_hori

addi a2 a2 -7
li a5 6
jal draw_line_hori

addi a2 a2 -1
jal draw_line_hori

addi a2 a2 -6
li a5 8
jal draw_line_hori

addi a2 a2 -1
jal draw_line_hori

#:
addi a1 a1 10
addi a2 a2 6
li a5 2
jal draw_line_hori

addi a2 a2 1
jal draw_line_hori

addi a2 a2 4
jal draw_line_hori

addi a2 a2 1
jal draw_line_hori

lw a0 0(sp)
lw a1 4(sp)
lw a2 8(sp)
lw a3 12(sp)
lw a5 16(sp)
lw ra 20(sp)
addi sp sp 24
ret



.include "../main.asm"