				.data
msg_input:		.asciiz "\nInserire numero intero unsigned: "
msg_errore:		.asciiz "\nErrore inserimento"

				.text
				.globl main
main:			
				
				li $v0, 4					# chiedo input
				la $a0, msg_input
				syscall
				
loop:			li $v0, 12					# leggo carattere
				syscall
				move $t0, $v0
				
				beq $t0, '\n', fine			# controllo se vuol finire
				
				# slt $t1, $t0, 48
				# bne $t1, $0, errore
				
				# slt $t1, $t0, 57
				# beq $t1, $0, errore
				
				blt $t0, '0', errore
				bgt $t0, '9', errore
				
				jr loop

errore:			li $v0, 4
				la $a0, msg_errore
				syscall

fine:			li $v0, 10
				syscall