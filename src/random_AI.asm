#######
# Get random unoccupied cell from board
# ------------
# inputs:  ## TODO aktuell noch s5 für check von unten
# ------------
# outputs: 
#######
random_ai:
# callee save
addi sp, sp, -32
sw a0, 0(sp)
sw a7, 4(sp)
sw t0, 8(sp)
sw t1, 12(sp)
sw t2, 16(sp)
sw t3, 20(sp)
sw t4, 24(sp)
sw ra, 28(sp)

## TODO DAS MUSS AUSGELAGERT WERDEN
## check if getBlockingMove returned 999 and no move can be blocked right now
li t1, 999
beq s5, t1, get_rand
mv a0, s5
j else_end2

get_rand:
## random number rars ecall
li a1, 10 # upper bound: 10
li a7, 42 # ecall identifier
ecall
# random number generator generates form 1-9, but we want 0-8
addi a0, a0, -1


# TODO WAS MACHT DAS?
else_end2:
lw t3, 0(sp)
slli t4, a0, 2
add t3, t3, t4
lw t4, 0(t3)
bnez t4, get_rand

mv a3, a0
li t2, 87

## TODO das muss ausgelagert werden
jal cell_to_coordinates

# callee restore
lw a0, 0(sp)
lw a7, 4(sp)
lw t0, 8(sp)
lw t1, 12(sp)
lw t2, 16(sp)
lw t3, 20(sp)
lw t4, 24(sp)
lw ra, 28(sp)
addi sp, sp, 32

ret

