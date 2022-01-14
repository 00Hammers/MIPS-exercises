					.data
					.text
					.globl main
					.ent main
main:				li $v0, 5
					syscall
					move $a0, $v0
					jal stampaTriangolo
					jal stampaQuadrato
					
fine:				li $v0, 10
					syscall
					
					.end main

					.ent stampaTriangolo
stampaTriangolo:	move $t5, $a0
					li $v0, 11
					move $t1, $0	# i
					move $t3, $0	# n			
					add $t4, $t0, $t5
while:				move $t2, $0 	# j
					addi $t3, $t3, 1	
ciclo:				li $a0, '*'
					syscall
					
					addi $t2, $t2, 1
					blt $t2, $t3, ciclo
					
					li $a0, '\n'
					syscall
					
					addi $t1, $t1, 1
					blt $t3, $t4, while
					
					move $a0, $t5
					
					jr $ra
					.end stampaTriangolo
					
					.ent stampaQuadrato
					li $v0, 11
stampaQuadrato:		move $t1, $0	# i
					move $t2, $0	# j
					move $t3, $a0	
ciclo1:				li $a0, '*'
ciclo2:				syscall

					addi $t1, $t1, 1
					blt $t1, $t3, ciclo2
					
					li $a0, '\n'
					syscall
					
					move $t1, $0
					
					addi $t2, $t2, 1
					blt $t2, $t3, ciclo1
					
					jr $ra
					.end stampaQuadrato
