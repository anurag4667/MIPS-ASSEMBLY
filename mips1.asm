#5 system call for user input
li $v0 , 5
syscall

li $t0, 0
move $t1, $v0
li $s0, 0

for :
	add $s0 , $s0 , $t0
	addi $t0,$t0, 1
	
	bne $t0,$t1,for

move $a0 , $s0
li $v0 , 1
syscall
