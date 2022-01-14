					.data
riga:				.asciiz "********"
					.text
					.globl main
					.ent main
main:				jal stampaTriangolo
					jal stampaQuadrato
					
fine:				li $v0, 10
					syscall
					
					.end main

					.ent stampaTriangolo
stampaTriangolo:	li $v0, 11
					move $t1, $0	# i
					move $t3, $0	# n			
					addi $t4, $t4, 8
while:				move $t2, $0 # j
					addi $t3, $t3, 1	
ciclo:				li $a0, '*'
					syscall
					
					addi $t2, $t2, 1
					blt $t2, $t3, ciclo
					
					li $a0, '\n'
					syscall
					
					addi $t1, $t1, 1
					blt $t3, $t4, while
					
					jr $ra
					.end stampaTriangolo
					
					.ent stampaQuadrato
stampaQuadrato:		move $t1, $0	# i		
					addi $t2, $0, 8	
ciclo1:				li $v0, 4
					la $a0, riga
					syscall
					
					li $v0, 11
					li $a0, '\n'
					syscall
					
					addi $t1, $t1, 1
					blt $t1, $t2, ciclo1
					
					jr $ra
					.end stampaQuadrato
					
					