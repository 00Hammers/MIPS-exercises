			.data
str:		.asciiz "domino"
			.text
			.globl main
			.ent main
main:		li $s0, 0
loop:		lb $a0, str($s0)
			
			beq $a0, $0, fine
			
			jal convert
			
			sb $v0, str($s0)
			
			move $a0, $v0
			li $v0, 11
			syscall
			
			addi $s0, $s0, 1
			j loop
			
# stampa:		li $v0, 4
			# la $a0, str
			# syscall
			
fine:		li $v0, 10
			syscall
			.end main
			
			.ent convert
convert:	addi $t0, $0, 'a'
			addi $a0, $a0, 'A'
			
			sub $v0, $a0, $t0
			
done:		jr $ra
			.end convert