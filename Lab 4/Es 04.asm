				.data
NUM_ROW = 10
NUM_COL = 10
DIM_COL = NUM_COL*4
DIM_MAT = NUM_ROW*DIM_COL

matrix:			.space DIM
				
				.text
				.globl main
				
				la $t0, matrix
				
main:			li $t1, 0			# i=0

loop_row:		li $t2, 0			# j=0

loop_col:		mul $t3, $t1, $t2
				sw $t3, matrix($t0)
				addi $t0, $t0, 4
				
				addi $t2, $t2, 1
				blt $t2, NUM_COL, loop_col
				
				addi $t1, $t1, 1
				blt $t1, NUM_ROW, loop_row

stampa:			li $t0, 0			
				li $t1, 0			# i=0
				
loop:			li $v0, 1
				lw $a0, matrix($t0)
				syscall
				
				li $v0, 11
				li $a0, '\t'
				syscall
				
				addi $t0, $t0, 4
				addi $t1, $t1, 1
				
				blt $t1, NUM_COL, no_capo
				
				li $v0, 11
				li $a0, '\n'
				syscall
				
				li $t1, 0
				
no_capo:		blt $t0, DIM_MAT, loop
				j fine		

fine:			li $v0, 10
				syscall
				
				