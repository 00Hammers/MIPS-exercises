		.data

var1:	.byte 'm'
var2:	.byte 'i'
var3:	.byte 'p'
var4:	.byte 's'
var5:	.byte 0

		.text
		.globl main
		
		.ent main
		
main:	
		lb $t1, var1
		addi $t1, $t1, -32	# 'm' -> 'M'
		
		lb $t2, var2
		addi $t2, $t2, -32	# 'i' -> 'I'
		
		lb $t3, var3
		addi $t3, $t3, -32	# 'p' -> 'P'
		
		lb $t4, var4
		addi $t4, $t4, -32	# 's' -> 'S'
		
		lb $t5, var5
		
		li $v0, 4			# syscall 4 (print_str)
		la $a0, var1		# argomento: stringa = vet
		syscall				# chiamata
		
		sb $t1, var1
		sb $t2, var2
		sb $t3, var3
		sb $t4, var4
				
		li $v0, 4
		la $a0, var1
		syscall
		
		li $v0, 10
		syscall
		
		.end main
		


