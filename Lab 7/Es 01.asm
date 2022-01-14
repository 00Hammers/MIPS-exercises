			.data
			.text
			.globl main
			.ent main
main:		li $t0, 4
			li $t1, 2
			li $t2, -5
			li $t3, 3
			
			li $s0, 8 	# 2^3
			li $s1, 4 	# 2^2
			li $s2, 27 	# 3^3
			li $s3, 9 	# 3^2
			li $s4, 64 	# 4^3
			li $s5, 16 	# 4^2
			
			jal polinomio
				
fine:		li $v0, 10
			syscall
				
			.end main

			.ent polinomio
polinomio:	
			
			
			jr $ra
			.end polinomio
			