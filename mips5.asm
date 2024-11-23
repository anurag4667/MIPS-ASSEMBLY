.data
palindrome : .asciiz "it is a palindrom\n"
notpalindrome : .asciiz "not a palindrome\n"
.text 
li $v0 , 5
syscall
move $s0, $v0

move $t0 , $s0
li $s1, 0
li $t1 , 10

reverse:
	div $t0,$t1
	mfhi $t2 
	mflo $t3
	mul $s1 , $s1 , 10
	add $s1 , $s1 , $t2
	move $t0 , $t3
	bne $t0 , $zero,reverse

bne $s0 , $s1 , ans
la $a0 , palindrome
li $v0, 4
syscall
li $v0 , 10
syscall

ans : 
	la $a0 , notpalindrome
	li $v0, 4
	syscall

	