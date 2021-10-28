#######
# STORE GAME POSITION IN ARRAY
# ------------
# inputs: a1 - Array start address
#         a2 - Array position starting from 0
#         a3 - Value to store 1 = X  2 = O
#######

store_in_array:
	slli a2, a2, 2 # shift by 2 -> multiply by 4 because every int is of size 4
	add a1, a1, a2 # add position to start address
	sw a3, 0(a1) # save value
	ret