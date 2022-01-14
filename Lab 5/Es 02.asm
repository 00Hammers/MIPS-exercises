				.data
str_giusto:		.asciiz "Numero palindromo"
str_sbagliato:	.asciiz "Numero non palindromo"
				
				.text
				.globl main

main:			move $t3, $0				#dim
				move $s0, $sp

loop_lettura:	li $v0, 12					#read char
				syscall
				
				beq $v0, '\n', fine_lettura
				addi $t3, $t3, 4			#dim+=4
				addi $sp, $sp, 4			#sp += 4
				sw $v0, ($sp)				#*sp = v0
				j loop_lettura

fine_lettura:	move $t0, $0				#i=0
				srl $t4, $t3, 1				#m=dim/(2^1)
				
loop_check:		sub $t5, $sp, $t0
				lw $t1, ($t5)				#c1 = *sp
				addi $t3, $t3, -4			#dim -= 4
				sub $t5, $sp, $t3			#tmp = sp-dim
				lw $t2, ($t5)				#c2 = *tmp
				addi $t0, $t0, 4			#i += 4
				bne $t1, $t2, falso			#c1 != c2 -> falso
				bgt $t4, $t0, loop_check	#m>i -> loop_check

				move $sp, $s0

palindromo:		li $v0, 4
				la $a0, str_giusto
				syscall
				j fine	

			
falso:			li $v0, 4
				la $a0, str_sbagliato
				syscall
				
fine:			li $v0, 10
				syscall
				