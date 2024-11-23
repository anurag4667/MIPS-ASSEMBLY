.data
newline: .asciiz "\n"

.text
li $v0 , 5
syscall

move $t0 , $v0

li $v0 , 5
syscall 

move $t1 , $v0

mul $a0 , $t0 , $t1
li $v0  , 1 
syscall

la $a0 , newline
li $v0, 4
syscall


div $a0 , $t0 , $t1
li $v0  , 1
syscall