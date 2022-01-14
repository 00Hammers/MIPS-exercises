				.data
NUM_ELEM = 20
DIM = 4*NUM_ELEM			#una parola vale 4 byte
vet:			.space DIM	#assegna DIM byte 

				.text
				.globl main

main:			add $t0, $0, $0
				
				#inserisco i primi due valori
				li $t1, 1
				sw $t1, vet($t0)
				addi $t0, $t0, 4
				
				li $t2, 1
				sw $t2, vet($t0)
				addi $t0, $t0, 4
				
				add $t4, $0, $0
				la $t4, DIM
				addi $t4, $t4, -8

ciclo:			add $t3, $t1, $t2		#t3 = t1 + t2
				sw $t3, vet($t0)
				
				add $t1, $t2, $0		#t1 = t2
				add $t2, $t3, $0		#t2 = t3
				
				addi $t0, $t0, 4
				
				slt $t3, $t0, $t4
				bne $t3, $0, ciclo
				
end:			li $v0, 10
				syscall
				
				
				
				
				
				
				
					
					