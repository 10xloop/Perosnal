
.global main
.text              
main:

la t0,num
lw a0,0(t0)
jal factorial
la t1,result
sw a1,0(t1)
j write_tohost

factorial:
  addi sp, sp, -16    # Make room on the stack for saved variables
  sw ra, 0(sp)        # Save the return address on the stack
  sw a0, 4(sp)        # Save n on the stack

  # Base case: n = 0 or n = 1, return 1
  li a1, 1
  beqz a0, return    # If n = 0, return 1
  beq a0, a1, return  # If n = 1, return 1

  # Recursive case: calculate (n-1)!
  addi a0, a0, -1
  jal factorial       # Call factorial(n-1)
  lw a0, 4(sp)        # Retrieve n from the stack
  mul a1, a0, a1      # Calculate n * (n-1)!
  add a3,a1,x0

return:
  lw ra, 0(sp)        # Retrieve the return address from the stack
  addi sp, sp, 16     # Release stack space
  add a6,ra,x0
  jr ra  

write_tohost:

li x1, 1

sw x1, tohost, t5

j write_tohost

.data
num: .word 3
result: .word 0

.align 12

.section ".tohost","aw",@progbits;                            

.align 4; .global tohost; tohost: .dword 0;                     

.align 4; .global fromhost; fromhost: .dword 0; 
