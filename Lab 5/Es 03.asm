				.data
msg_no_sol:		.asciiz "Nessuna soluzione reale."
msg_coinc:		.asciiz "Due soluzioni coincidenti."
msg_due_sol:	.asciiz "Due soluzioni reali."
				
				.text
				.globl main

main:			li $v0, 5
				syscall
				move $t1, $v0
				
				li $v0, 5
				syscall
				move $t2, $v0
				
				li $v0, 5
				syscall
				move $t3, $v0
				
				mul $t4, $t2, $t2		#t4 = b^2
				mul $t5, $t1, $t3		#t5 = ac
				sll $t5, $t5, 2			#t5 = 4ac
				sub $t5, $t4, $t5		#t5 = determinante
				
				slt $t0, $t5, $0
				bne $t0, $0, no_sol

				beq $t5, $t0, sol_coinc
				
				la $a0, msg_due_sol
				j fine

sol_coinc:		la $a0, msg_no_sol
				j fine

no_sol:			la $a0, msg_no_sol
				j fine
				
fine:			li $v0, 4
				syscall

				li $v0, 10
				syscall
				
