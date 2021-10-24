draw_board_numbers:
li a3, 0x00ff00 # set color to green
# draw 1
li a1, 2
li a2, 0
jal draw_pixel
li a1, 3
jal draw_pixel
li a2, 1
jal draw_pixel
li a2, 2
jal draw_pixel
li a2, 3
jal draw_pixel
li a2, 4
jal draw_pixel
# draw 2
li a1 88
li a2 1
jal draw_pixel
li a1 89
li a2 0
jal draw_pixel
li a1 90
jal draw_pixel
li a1 91
li a2 1
jal draw_pixel
li a1 90
li a2 2
jal draw_pixel
li a1 89
li a2 3
jal draw_pixel
li a1 88
li a2 4
jal draw_pixel
li a1 89
jal draw_pixel
li a1 90
jal draw_pixel
li a1 91
jal draw_pixel

# draw 3
li a2 0
li a1 175
jal draw_pixel
li a1 176
jal draw_pixel
li a1 177
jal draw_pixel
li a1 178
jal draw_pixel
li a2 2
li a1 176
jal draw_pixel
li a1 177
jal draw_pixel
li a1 178
jal draw_pixel
li a2 4
li a1 175
jal draw_pixel
li a1 176
jal draw_pixel
li a1 177
jal draw_pixel
li a1 178
jal draw_pixel
li a2 1
jal draw_pixel
li a2 3
jal draw_pixel

# draw 4
li a1 1
li a2 87
jal draw_pixel
li a2 88
jal draw_pixel
li a2 89
jal draw_pixel
li a1 2
jal draw_pixel
li a1 3
jal draw_pixel
li a1 4
jal draw_pixel
li a2 87
jal draw_pixel
li a2 88
jal draw_pixel
li a2 90
jal draw_pixel
li a2 91
jal draw_pixel
# draw 5
li a1 91
li a2 87
jal draw_pixel
li a1 90
jal draw_pixel
li a1 89
jal draw_pixel
li a1 88
jal draw_pixel
li a2 88
jal draw_pixel
li a2 89
jal draw_pixel
li a1 89
jal draw_pixel
li a1 90
jal draw_pixel
li a1 91
jal draw_pixel
li a2 90
jal draw_pixel
li a2 91
jal draw_pixel
li a1 90
jal draw_pixel
li a1 89
jal draw_pixel
li a1 88
jal draw_pixel
# draw 6
li a1 178
li a2 87
jal draw_pixel
li a1 177
jal draw_pixel
li a1 176
jal draw_pixel
li a1 175
jal draw_pixel
li a2 88
jal draw_pixel
li a2 89
jal draw_pixel
li a1 176
jal draw_pixel
li a1 177
jal draw_pixel
li a1 178
jal draw_pixel
li a2 90
jal draw_pixel
li a1 175
jal draw_pixel
li a2 91
jal draw_pixel
li a1 176
jal draw_pixel
li a1 177
jal draw_pixel
li a1 178
jal draw_pixel
# draw 7
li a1 1
li a2 174
jal draw_pixel
li a1 2
jal draw_pixel
li a1 3
jal draw_pixel
li a1 4
jal draw_pixel
li a2 175
jal draw_pixel
li a1 3
li a2 176
jal draw_pixel
li a1 2
li a2 177
jal draw_pixel
li a1 1
li a2 178
jal draw_pixel
# draw 8
li a1 88
li a2 174
jal draw_pixel
li a1 89
jal draw_pixel
li a1 90
jal draw_pixel
li a1 91
jal draw_pixel
li a2 175
jal draw_pixel
li a1 88
jal draw_pixel
li a1 89
li a2 176
jal draw_pixel
li a1 90
jal draw_pixel
li a2 177
li a1 91
jal draw_pixel
li a1 88
jal draw_pixel
li a2 178
jal draw_pixel
li a1 89
jal draw_pixel
li a1 90
jal draw_pixel
li a1 91
jal draw_pixel
# draw 9
li a1 178
li a2 174
jal draw_pixel
li a1 177
jal draw_pixel
li a1 176
jal draw_pixel
li a1 175
jal draw_pixel
li a2 175
jal draw_pixel
li a2 176
jal draw_pixel
li a1 176
jal draw_pixel
li a1 177
jal draw_pixel
li a1 178
jal draw_pixel
li a2 177
jal draw_pixel
li a1 175
li a2 178
jal draw_pixel
li a1 176
jal draw_pixel
li a1 177
jal draw_pixel
li a1 178
jal draw_pixel
li a2 175
jal draw_pixel