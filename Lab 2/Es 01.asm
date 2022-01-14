		.data
msg:		.asciiz "Inserire numero: "
msg_pos:	.asciiz "Il numero è positivo"
msg_neg:	.asciiz "Il numero è negativo"

		.text
		.globl main
		.ent main

main:   li $v0, 4
		la $a0, msg
		syscall
		
		li $v0, 5
		syscall
		add $t0, $0, $v0
		
		andi $t1, $t0, 1
		
		beq $t1, $0, true
		li $v0, 4
		la $a0, msg_neg
		syscall
		j done

true:	li $v0, 4
		la $a0, msg_pos
		syscall

done:	li $v0, 10
		syscall
		
		.end main