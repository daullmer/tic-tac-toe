.data

input_string: .string "Please input a number from 1 to 9 \n"
wrong_input: .string "Your number was too high or too low! \n"

.include "../tic-tac-toe/src/libs/cesplib_rars.asm"


.text

li s1, DISPLAY_WIDTH # initialize register s1 with the predefined display width
li s2, DISPLAY_HEIGHT # initialize register s2 with the predefined display height

li a1, 41
li a2, 41


input:
la a0, input_string
li a7, 4
ecall # prints input_string to console

li a7, 5
ecall # reads int from console and saves in a0

li t0, 1
blt a0, t0, errormsg
li t0, 9
bgt a0, t0, errormsg # checks if input is in range

addi a0, a0, -1

li t2, 87
switch_start:

	switch_13:
	li t0, 2
	bgt a0, t0, switch_46
	
	mul t1, a0, t2
	add a1, a1, t1
	
	j end
	
	switch_46:
	li t0, 5
	bgt a0, t0, switch_79
	addi a0, a0, -3
	
	addi a2, a2, 87
	mul t1, a0, t2
	add a1, a1, t1
	
	j end
	
	switch_79:
	addi a0, a0, -6
	
	addi a2, a2, 174
	mul t1, a0, t2
	add a1, a1, t1
	
	

end:
li a7, 10
ecall

errormsg:
la a0, wrong_input
li a7, 4
ecall # pritns wrong_input to console
j input


.include "../tic-tac-toe/src/draw/draw_X.asm"