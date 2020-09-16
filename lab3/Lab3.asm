# Crystal Yu (cbyu@ucsc.edu)
# Lab 3: Decimal Converter
# Due: 11/1/17
# Section: 01F 
# TA: Justin Lee
.text
main:

	# Read the Input
	move $s0, $a1
	lw $s0, ($s0)
	move $t1, $s0
	
	la	 $a0, hello_msg # load the addr of hello_msg into $a0.
	li	 $v0, 4 # 4 is the print_string syscall.
	syscall 	# do the syscall.
	
	# This tells you what the user inputed
	li $v0, 4
	la $a0, prompt # Prints the prompt
	syscall
	li $v0, 4
	la $a0, ($s0) # Prints the number
	syscall
	
	li $s1, 0 # Setting s1 as where we will store the integer
	# Loops through the string character by character
	loop:
		lb $t2, ($t1)
		beq $t2, '\0', end # If the character is null, that is the end of the string
		beq $t2, '-', negative # If the input is negative go to line 37
		mul $s1, $s1, 10 # Moves the value one place up
		sub $t3, $t2, 48 # Gets the decimal value of one digit of the stored number
		addu $s1, $s1, $t3 # Adds the decimal value into s1
		add $t1, $t1, 1 # Go to the next place
		j loop
	
	negative:
		li $s2, 1 # Stores the fact that the number is negative
		add $t1, $t1, 1 # Go to the next place
		j loop # Goes back to the loop
	end:
	
	beqz $s2, endIf # If the number is not negative, dont do the next step
	not  $s1, $s1
	addiu $s1, $s1, 1
	
	endIf:
	
	# Outputs the output
	li $v0, 4
	la $a0, output # This outputs the string
	syscall
	
	li $s2, 0x80000000 #Stores the largest number in hex at s2
	
	# Determine the number in binary and prints it
	li $t3, 32 # t3 will show how many bits are left to load
	loop2:
		beqz $t3, endLoop2 # If there are no more bits left to process leave the loop
		sub $t3, $t3, 1 # There is one less bit to process
		and $t1, $s2, $s1 # Stores the and of s1 an s2 into t1 to determine if the first bit is zero or one
		beqz $t1, printZero # If the number is zero, print zero
		li $v0, 1
		la $a0, 1 # Print 1 if not print 0
		syscall
		srl $s2, $s2, 1 # Shifts the bit over
		j loop2 # Go back to the beginning of the loop
	
	printZero:
		li $v0, 1
		la $a0, 0 # Prints out a 0
		syscall
		srl $s2, $s2, 1 # Shifts the bit over
		j loop2
	
	endLoop2:
	
	li	 $v0, 10 # 10 is the exit syscall.
	syscall 	# do the syscall.
# Data for the program:
.data
output: .asciiz 	"\nOutput Number: "
hello_msg: .asciiz 	"Welcome to the Decimal to Binary Converter"
prompt: .asciiz		"\nInput Number: "
