jal sound
.data
.L__const.main.pitches:
  .word 72 
  .word 67 
  .word 67 
  .word 69 
  .word 67 
  .word 71 
  .word 72 
  .word 0 

.L__const.main.duration:
  .word 400 # 0x190
  .word 200 # 0x190
  .word 200 # 0x190
  .word 400 # 0x190
  .word 800 # 0x190
  .word 400 # 0x190
  .word 400 # 0x190
  .word 30 # 0x1e
.text
play_sound: # @play_sound(int, int)
  mv a4, a1
  mv a5, a0
  addi a2, zero, 16
  mv a2, a2
  addi a3, zero, 127
  mv a3, a3
  mv a1, a4
  mv a0, a5
  addi a7, zero, 33
  ecall 

  ret
sound: # @main
  mv a4, zero
  lui a0, %hi(.L__const.main.pitches)
  addi a6, a0, %lo(.L__const.main.pitches)
  lui a0, %hi(.L__const.main.duration)
  addi t2, a0, %lo(.L__const.main.duration)
  addi a7, zero, 16
  addi t0, zero, 127
  addi t1, zero, 16
LBB1_1: # =>This Inner Loop Header: Depth=1
  slli a0, a4, 2
  andi a0, a0, 28
  add a1, a0, a6
  add a0, a0, t2
  lw a5, 0(a0)
  lw t3, 0(a1)
  li a2, 0
  mv a3, t0
  mv a1, a5
  mv a0, t3
  addi a7, zero, 33
  addi a4, a4, 1
  ecall 

  bne a4, t1, LBB1_1
  mv a0, zero
  
  li a7, 10
  ecall
