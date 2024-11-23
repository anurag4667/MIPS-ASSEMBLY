.data
array : .word 5, 7, 3, 22, 0, 90, 4
space : .asciiz " "
.text
li $t0 , 0
li $t1, 24
li $t2 , 28

loop1 : 
	li $t3  ,0 # j index
	addi $t3,$t3,4 # j = i + 1
	
	loop2:
	move $t4 , $t3
	subi $t4, $t4 , 4
	
	lw $s1, array($t3)
	lw $s0, array($t4)
	
	bgt $s1 , $s0 , next
	sw $s0 , array($t3)
	sw $s1 , array($t4)
	
	next:
	addi $t3  , $t3 , 4
	bne $t3 , $t2 , loop2
	subi $t2 , $t2 , 4
	addi $t0 , $t0, 4
	bne $t0 , $t1 , loop1
	

li $t0 , 0
li $t1 , 28
loop:
	li $v0 , 1	
	lw $a0 , array($t0)
	syscall
	la $a0 , space
	li $v0 , 4
	syscall
	addi $t0, $t0 , 4
	bne $t0 , $t1 , loop
		
