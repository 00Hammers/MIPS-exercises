 #hi sempre 0x0000
 #poi shifto
 #se hi != da 0x0000 allora era presente un 1
 
				.data
num:			.half 1979

				.text
				.globl main
				
main:			lh $s1, num
				li $t0, 0				# contatore
				
				li $t1, 1				# i
				li $t2, 16				# n_max = 16
				add $t3, $s1, $0		# t3 = num	
ciclo:			andi $t3, $t3, 1		# t3 = t3 and 1
				beq $t3, $0, condizione # se t3 = 0 vai a condizione
				addi $t0, $t0, 1		# contatore++
condizione:		srl $t3, $s1, $t1		# shifta di uno a destra
				addi $t1, $t1, 1		# i++
				slt $t4, $t1, $t2		# if i<n_max: t4 != 0
				bne $t4, $0, ciclo
				
				li $v0, 1
				add $a0, $t0, $0
				syscall
				
				li $v0, 10
				syscall
				
			
