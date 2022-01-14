			.data
v0:			.word 19
v1:			.word 42
v2:			.word 69

			.text
			.globl main

main:		lw $s1, v0
			lw $s2, v1
			lw $s3, v2
			
			slt $t0, $s1, $s2
			bne $t0, $0, next1
			
			move $t0, $s1
			move $s1, $s2
			move $s2, $t0
			
next1:		slt $t0, $s1, $s3
			bne $t0, $0, next2
	
			move $t0, $s1
			move $s1, $s3
			move $s3, $t0

next2:		slt $t0, $s2, $s3
			bne $t0, $0, done
			
			move $t0, $s2
			move $s2, $s3
			move $s3, $t0

done:		li $v0, 1
			move $a0, $s1
			syscall
			
			li $v0, 1
			move $a0, $s2
			syscall
			
			li $v0, 1
			move $a0, $s3
			syscall
			
fine:		li $v0, 10
			syscall