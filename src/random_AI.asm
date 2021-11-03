#######
# Get random unoccupied cell from board
# ------------
# inputs:  a0 - array address
# ------------
# outputs: a0 - random cell
#          a3 - random cell
#######
random_ai:
# callee save
addi sp, sp, -20
sw a0, 0(sp)
sw a7, 4(sp)
sw t3, 8(sp)
sw t4, 12(sp)
sw ra, 16(sp)

get_rand:
## random number rars ecall
li a1, 10 # upper bound: 10
li a7, 42 # ecall identifier
ecall
# random number generator generates form 1-9, but we want 0-8
addi a0, a0, -1

# check if randomly generated field is already occupied
# if yes, generate another number
lw t3, 0(sp) # load initial a0 to t3
slli t4, a0, 2
add t3, t3, t4
lw t4, 0(t3)
bnez t4, get_rand

# callee restore
lw a7, 4(sp)
lw t3, 8(sp)
lw t4, 12(sp)
lw ra, 16(sp)
addi sp, sp, 20

ret

