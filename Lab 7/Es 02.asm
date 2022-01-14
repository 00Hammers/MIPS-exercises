					.data
					.text
					.globl main
					.ent main
main:				li $v0, 5
					syscall
					move $a0, $v0
					jal calcolaSuccessivo
					
					move $t0, $v0
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
			