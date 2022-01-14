			.data
vet:		.word 1 42 19 7 8 10
len:		.word 6
			.text
			.globl main
			.ent main
main:		la $a0, vet
			lw $a1, len
			
			jal massimo
			
			move $a0, $v0
			li $v0, 1
			syscall

fine:		li $v0, 10
			syscall
			.end main
			
			.ent massimo
massimo:	sll $a1, $a1, 2			# a1 *= 4
			li $t0, 4				# t0 = 4, contatore
			lw $v0, vet($0)			# v0 = vet[0], massimo
			
loop:		lw $t1, vet($t0)		# t1 = vet[i]
			slt $t2, $v0, $t1			
			beq $t2, $0, smaller
bigger:		move $v0, $t1
smaller:	addi $t0, $t0, 4
			blt $t0, $a1, loop
			
			jr $ra
			.end massimo