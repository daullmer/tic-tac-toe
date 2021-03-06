.data

input_string: .string "Please input a number from 1 to 9 \n"
hilo_error_string: .string "Your number was too high or too low! \n"
occupied: .string "Please select an empty field! \n"


.text
#######
# GET INPUT FROM CONSOLE
# ------------
# inputs: none
# ------------
# outputs: a1 - x center coordinate 
#          a2 - y center coordinate
#          a3 - selected field
#######
select_field:

addi sp, sp, -32
sw a0, 0(sp)
sw a7, 4(sp)
sw t0, 8(sp)
sw t1, 12(sp)
sw t2, 16(sp)
sw t3, 20(sp)
sw t4, 24(sp)
sw ra, 28(sp)

input:

la a0, input_string
li a7, 4
ecall # prints input_string to console

li a7, 5
ecall # reads int from console and saves in a0

li t0, 1
blt a0, t0, hilo_error
li t0, 9
bgt a0, t0, hilo_error # checks if input is in range


addi a0, a0, -1

lw t3, 0(sp)
slli t4, a0, 2
add t3, t3, t4
lw t4, 0(t3)
bnez t4, occupied_error

mv a3, a0 # save input number -1 to a3 and return it

jal cell_to_coordinates

end:

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

## Prints Error if input is below 1 or above 9
hilo_error:
la a0, hilo_error_string
li a7, 4
ecall # prints hilo_error_string to console
j input

## Print Error if place is already occupied
occupied_error:
la a0, occupied
li a7, 4
ecall # prints occupied string to console
j input




#######
# Transform cell position (0-8) into center coordinates
# ------------
# inputs:  a0 - array position
# ------------
# outputs: a1 - x center coordinate 
#          a2 - y center coordinate
#######
cell_to_coordinates:

# callee save
addi sp sp -28
sw a0 0(sp)
sw t0 4(sp)
sw t1 8(sp)
sw t2 16(sp)

# load constants
li t2, 87
li a1, 41
li a2, 41

	switch_13:
	li t0, 2
	bgt a0, t0, switch_46
	
	mul t1, a0, t2
	add a1, a1, t1
	
	j switch_end
	
	switch_46:
	li t0, 5
	bgt a0, t0, switch_79
	addi a0, a0, -3
	
	addi a2, a2, 87
	mul t1, a0, t2
	add a1, a1, t1
	
	j switch_end
	
	switch_79:
	addi a0, a0, -6
	
	addi a2, a2, 174
	mul t1, a0, t2
	add a1, a1, t1

switch_end:	

# callee restore
lw a0 0(sp)
lw t0 4(sp)
lw t1 8(sp)
lw t2 16(sp)
addi sp sp 28
ret
