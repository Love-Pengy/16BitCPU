.text 
.globl main

#$v = $s


main: 
	addi $s0, $zero, 0x0040
	addi $s1, $zero, 0x1010
	addi $s2, $zero, 0x000F
	addi $s3, $zero, 0x00F0
	
	add $t0, $zero, $zero
	addi $a0, $zero, 0x1010
	addi $a1, $zero, 0x10000005
	
	WHILE: beq $a1, $zero END
	
		subi $a1, $a1, 1
		lw $t0, 0($a0)
		
		bgt $t0, 0x0100 IFSTATEMENT
			sll $s2, $s2, 2
			xor $s3, $s3, $s2
			addi $t1, $zero, 0x00FF
			sw $t1, 0($a0)
			j ENDIF
		IFSTATEMENT: 
			srl $s0, $s0, 4
			or $s1, $s1, $s0
			addi $t1, $zero, 0xFF00
			sw $t1, 0($a0)
		ENDIF: 
			addi $a0, $a0, 2
			j WHILE
	END:
		
	.data
	.align 2	
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
	
	