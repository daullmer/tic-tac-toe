.data

input_string: .string "Please input a number from 1 to 9 \n"
wrong_input: .string "Your number was too high or too low! \n"


.text

input:
li a1, 41
li a2, 41

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
ret

errormsg:
la a0, wrong_input
li a7, 4
ecall # pritns wrong_input to console
j input