				.data
giorni:			.byte	231
ore:			.byte	16
minuti:			.byte	47
risultato:		.byte	0

				.text
				.globl main
				
main:			lb $s1, giorni
				lb $s2, ore
				lb $s3, minuti
				
				move $t0, $0
				mul $t1, $s1, 1440	# giorni*1400 = min_giorni
				add $t0, $t0, $t1	# t += min_giorni
				mul $t1, $s1, 60	# ore*60 = min_ore
				add $t0, $t0, $t1	# t += min_ore
				add $t0, $t0, $s3	# t += minuti
				
				sb $t0, risultato
				
				li $v0, 1
				move $a0, $t0
				syscall

fine:			li $v0, 10
				syscall