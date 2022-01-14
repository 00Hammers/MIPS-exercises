#Siano date le seguenti variabili di tipo byte già
#inizializzate in memoria:
#• n1: .byte 10
#• n2: .byte 0x10
#• n3: .byte '1'
#• Sia inoltre definita la variabile di tipo byte, 
#non inizializzata, res
#• Si calcoli la seguente espressione e si verifichi il risultato
# res = n1 - n2 + n3

		.data
		
n1: 	.byte 2
n2: 	.byte 0x10
n3:		.byte '1'
res:	.word 0
		
		.text
		.globl main
		.ent main
main:

		lb $t1, n1
		lb $t2, n2
		lb $t3, n3
		
		sub $t0, $t1, $t2
		add $t0, $t0, $t3
		li $v0, 1
		move $a0, $t0
		syscall
		
		sw $t0, res
		
		li $v0, 10
		syscall
		
		.end main
