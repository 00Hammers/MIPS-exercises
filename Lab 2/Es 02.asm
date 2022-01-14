			.data
msg1:		.asciiz "Inserire numero intero positivo: "
msg_error:	.asciiz "Numeri non rappresentabili in un byte."
			
			.text
			.globl main

main:		
			li $t0, 0xFFFFFF00
			
			li $v0, 4
			la $a0, msg1
			syscall
			
			li $v0, 5
			syscall
			
			and $t1, $v0, $t0
			bne $t1, $0, error
			add $t1, $v0, $0
			
			li $v0, 4
			la $a0, msg1
			syscall
			
			li $v0, 5
			syscall
			
			and $t2, $v0, $t0
			bne $t2, $0, error
			add $t2, $v0, $0
		
			not $t3, $t2		# not B
			and $t3, $t1, $t3	# A and (not B)
			not $t3, $t3		# not(A and (not(B)))
			xor $t4, $t1, $t2	# A xor B
			or $t4, $t3, $t4	# not(A and (not(B))) or (A xor B)

			li $t0, 0x000000FF
			and $t0, $t4, $t0
			
			li $v0, 1
			add $a0, $t0, $0
			syscall
			
			j fine
		
error:		li $v0, 4
			la $a0, msg_error
			syscall
			
fine:		li $v0, 10
			syscall
