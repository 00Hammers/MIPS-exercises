					.data
					.text
					.globl main
					.ent main
main:				li $v0, 5
					syscall
	
					li $t0, 1	#contatore
					li $t1, 1	#valore da raggiungere
loop:				
					addiu $sp, $sp, -12
					sw $ra, 8($sp)
					sw $t0, 4($sp)
					sw $t1, ($sp)
					
					move $a0, $v0
					jal calcolaSuccessivo
					
					lw $t1, ($sp)
					lw $t0, 4($sp)
					lw $ra, 8($sp)
					addiu $sp, $sp, 12
					
					addi $t0, 1
					
					bne $v0, $t1, loop
					
					move $v0, $t0
					li $v0, 1
					move $a0, $t0
					syscall
					
fine:				li $v0, 10
					syscall
						
					.end main

					.ent calcolaSuccessivo
calcolaSuccessivo:	and $t1, $a0, 1
					beqz $t1, pari

					mul $v0, $a0, 3
					addi $v0, $v0, 1
					j fatto

pari:				div $v0, $a0, 2
				
fatto:				jr $ra
					.end calcolaSuccessivo
			