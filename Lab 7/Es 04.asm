					.data
mat:				.word 10, 6, 7, 4
					.text
					.globl main
					.ent main
main:				la $t0, mat
					lw $a0, 0($t0)
					lw $a1, 4($t0)
					lw $a2, 8($t0)
					lw $a3, 12($t0)
					
					jal determinante2x2
				
					move $a0, $v0
					li $v0, 1
					syscall
					
fine:				li $v0, 10
					syscall
						
					.end main

					.ent determinante2x2
determinante2x2:	mul $t0, $a0, $a3
					mul $t1, $a1, $a2
					sub $v0, $t0, $t1
				
fatto:				jr $ra
					.end determinante2x2