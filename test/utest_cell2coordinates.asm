
li a0, 0
jal cell_to_coordinates
mv s1, a1
mv s2, a2

li a0, 4
jal cell_to_coordinates
mv s3, a1
mv s4, a2

li a0, 8
jal cell_to_coordinates
mv s5, a1
mv s6, a2

li a7, 10
ecall

.include "../src/select_field.asm"