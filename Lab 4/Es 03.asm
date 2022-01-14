# mio
				.data
NUM_ELEM=4
DIM_VET = 4*NUM_ELEM
DIM_MAT = DIM_VET*NUM_ELEM
vetrig:			.word 12, 56, 1, -5
vetcol:			.word -51, 11, 0, 4
matrice:		.space DIM_MAT

				.text
				.globl main
				
main:			move $t0, $0 # offset matrice
				move $t1, $0 # offset righe
				li $t5, DIM_VET
				
loop_row:		move $t2, $0 # offset colonne

loop_col:		lw $t3, vetrig($t1)
				lw $t4, vetcol($t2)
				
				mult $t3, $t4
				
				mfhi $t3
				bne $t3, $0, overflow
				
				mflo $t3
				sw $t3, matrice($t0)
				
				addi $t0, $t0, 4
				addi $t2, $t2, 4
				blt $t2, $t5, loop_col
				addi $t1, $t1, 4
				blt $t1, $t5, loop_row
				
				move $t0, $0
ciclo:			lw $a0, matrice($t0)
				addi $t0, $t0, 4
				li $v0, 1
				syscall
				li $a0, '\n'
				li $v0, 11
				syscall
				blt $t0, DIM_MAT, ciclo
				
				j fine

overflow:		# gestione overflow
				
fine:			li $v0, 10
				syscall