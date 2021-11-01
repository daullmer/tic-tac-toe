
.text
random_ai:
addi sp, sp, -28
sw a0, 0(sp)
sw a7, 4(sp)
sw t0, 8(sp)
sw t1, 12(sp)
sw t2, 16(sp)
sw t3, 20(sp)
sw t4, 24(sp)



get_rand:
li a1, 10
li a7, 42
ecall

li a1, 41
li a2, 41

addi a0, a0, -1

lw t3, 0(sp)
slli t4, a0, 2
add t3, t3, t4
lw t4, 0(t3)
bnez t4, get_rand

mv a3, a0
li t2, 87

j switch_start