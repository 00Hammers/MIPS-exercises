			.data
n:			.word 3141592653
			.text
				
			.globl main
main:		lw $t0, n
			li $t1, 0			# i=0
			li $t2, 10
			li $t3, 0			# resto
			
calcolo:    div $t4, $t0, $t2	# tmp = n/10
			mul $t3, $t4, $t2	# resto = tmp*10
			sub $t3, $t0, $t4	# resto = n-tmp	(effettivo resto)
			move $t0, $t4		# n = tmp = n/10
			
			addi $t1, $t1, 1
			
			addu $sp, $sp, 4
			sw $t3, ($sp)
			
			bne $t3, $0, calcolo
			
			li $t0, 0
			li $v0, 5
stampa:		lw $a0, ($sp)
			subu $sp, $sp, 4
			syscall
			
			addi $t0, $t0, 1
			blt $t0, $t1, stampa
			
fine:		li $v0, 10	
			syscall
			