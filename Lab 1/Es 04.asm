		.data
var:	.word 0x3FFFFFF0

		.text
		.globl main
		.ent main
main:
		lw $t1, var
		
		add $t1, $t1, $t1
	#	addi $t0, $t0, 40		# overflow
		
	#	addi $t2, $0, 40
	#	add $t0, $t1, $t2		# pure
		
		addiu $t0, $t1, 40		# unsigned, overflow ma no errore
		
		li $v0, 1
		move $a0, $t0
		syscall	
		
		li $v0, 10
		syscall
		.end main