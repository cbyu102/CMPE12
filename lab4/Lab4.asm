# Crystal Yu (cbyu@ucsc.edu)
# 11/12/17
# Lab 4

.text
main:
	# This takes the user's input
	li $v0, 4
	la $a0, prompt # Prints the prompt
	syscall
	li $v0, 5 # Reads input into v0
	syscall
	move $s0, $v0 # Stores the value in s0
	
	# Prints 2 as a prime number
	li $v0, 1
	la $a0, 2
	syscall
	
	# Stores the numbers we are looping through in s1
	li $s1, 3
	# Stores the number we are dividing by in t3
	li $t2, 2
	
	# Loops through a number to see if it is prime
	isPrime:
		rem $t1, $s1, $t2 # finds the remainder
		beqz $t1, next # if the remainder equals zero, it is not prime. go to next number
		div $t3, $s1, 2 # set t3 equal to n/2
		bge $t2, $t3, print # if all numbers tried dividing doesn't work, number is prime. print.
		add $t2, $t2, 1 # adds 1 to t2 to try dividing next number up
		j isPrime
	
	print:
		# Prints the number because it is prime
		li $v0, 4
		la $a0, comma # Prints the comma
		syscall
		li $v0, 1
		la $a0, ($s1) # Prints the number
		syscall
		j next # go to the next number
	
	next:
		li $t2, 2 # Resets the divisor to 2
		beq $s1, $s0, end # If we are at the last number, go to the end bc there is no next number
		add $s1, $s1, 1 # go to the next number
		j isPrime # check if number is prime
	end:

	
	li	 $v0, 10 # 10 is the exit syscall.
	syscall 	# do the syscall.
	
# Data for the program:
.data
comma: .asciiz 	", "
prompt: .asciiz		"\nInput Number: "
# end hello.asm
