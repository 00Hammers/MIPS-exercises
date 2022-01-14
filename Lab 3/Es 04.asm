				.data
DIM = 3
msg_input:		.asciiz "Inserire numero intero: "
msg_output:		.asciiz "Media numeri: "

				.text
				.globl main

main:		    add $t0, $0, $0			# i = 0
				add $t1, $0, $0			# t1 = 0
				
ciclo:			li $v0, 4
				la $a0, msg_input
				syscall
				
				li $v0, 5				# leggo numero
				syscall
				
				add $t1, $t1, $v0		# incremento accumulatore
				addi $t0, $t0, 1		# incremento contatore
				
				slt $t2, $t0, DIM
				bne $t2, $0, ciclo
				
				div $t1, $t1, DIM		# media in t1
				
				li $v0, 4
				la $a0, msg_output
				syscall
				
				li $v0, 1
				move $a0, $t1
				syscall
				
fine:			li $v0, 10
				syscall