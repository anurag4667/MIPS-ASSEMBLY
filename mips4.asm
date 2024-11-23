.data
newline : .asciiz "\n"

.text
.globl main

main:
    

    # Read the number of elements
    	li $v0, 5                 # syscall to read integer
    	syscall
    	move $t0, $v0             # store number of elements in $t0
    	sll $t1, $t0, 2           # calculate size of array (number of elements * 4 bytes)
    	li $t2, 0                 # initialize counter for array index

    # Dynamically allocate space for the array
    	li $v0, 9                 # syscall to request memory allocation
    	move $a0, $t1             # pass size of array in bytes
    	syscall
    	move $s0, $v0             # $s0 holds the base address of the array

input_loop:

    # Read element
    	li $v0, 5                 # syscall to read integer
    	syscall
    	sw $v0, 0($s0)            # store the input at the current array index

    # Update address for next element
    	addi $s0, $s0, 4
    	addi $t2, $t2, 1
   	bne $t2, $t0, input_loop  # repeat until all elements are read

# Reset $s0 to start of the array
sub $s0, $s0, $t1

li $t2 , 0

print_loop:
    # Load and print each element
    	lw $a0, 0($s0)            # load current element into $a0
    	li $v0, 1                 # syscall to print integer
    	syscall

    	# Print newline after each element
    	li $v0, 4                 # syscall to print string
    	la $a0, newline           # load address of newline
    	syscall

    # Move to the next element in the array
    	addi $s0, $s0, 4
    	addi $t2, $t2, 1
    	bne $t2, $t0, print_loop  

    # Exit program
