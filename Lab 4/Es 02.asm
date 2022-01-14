				.data
opa:			.word 2043
opb:			.word 5
res:			.space 4
tab:			.word op0, op1, op2, op3

				.text
				.globl main

main:			lw $t1, opa
				lw $t2, opb
				
				li $v0, 5
				syscall

				slt $t0, $v0, $0
				bne $t0, $0, error
				
				addi $t0, $0, 4
				slt $t0, $v0, $t0
				beq $t0, $0, error
				
				sll $t0, $v0, 2		# t0 = v0 * 2^2
				lw $t0, tab($t0)
				jr $t0
				
				# beq $v0, $0, op0
				
				# li $t3, 1
				# beq $v0, $t3, op1
				
				# li $t3, 2
				# beq $v0, $t3, op2
				
				# li $t3, 3
				# beq $v0, $t3, op3

op0:			add $t1, $t1, $t2
				b fine

op1:			sub $t1, $t1, $t2
				b fine

op2:			mul $t1, $t1, $t2
				b fine

op3:			div $t1, $t1, $t2
				b fine

error:			li $t1, 0

fine:			sw $t1, res
				
				li $v0, 1
				add $a0, $t1, $0
				syscall
				
				li $v0, 10
				syscall
				
