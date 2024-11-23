#array static
.data
array : .space 20
print : .asciiz "sum is = "
.text

li $t0, 0
li $t1 , 20

#taking input
input_loop :
	li $v0 , 5
	syscall
	sw $v0, array($t0)
	addi $t0,$t0,4
	bne $t0,$t1 , input_loop

#print the sum

li $s0 , 0
li $t0 , 0
sum_loop:
	lw $t2 , array($t0)
	add $s0 , $s0 , $t2
	addi $t0 ,$t0, 4
	bne $t0,$t1 , sum_loop

li $v0 , 4
la $a0 , print
syscall
li $v0 , 1
move $a0 , $s0
syscall