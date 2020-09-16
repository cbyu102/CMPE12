# Crystal Yu (cbyu@ucsc.edu)
# Lab 5
# Due: 11/26/17
# Section: 01F 
# TA: Justin Lee
.text
main:

	# Read the Input
	move $s0, $a1
	lw $s0, ($a1) # Read the Key
	lw $s1, 4($a1) # Read the text
	
	# This tells you the key the user inputed
	li $v0, 4
	la $a0, keyis # Prints the prompt
	syscall
	li $v0, 4
	la $a0, ($s0) # Prints the key
	syscall
	
	# This tells you the text the user inputed
	li $v0, 4
	la $a0, textis # Prints the prompt
	syscall
	li $v0, 4
	la $a0, ($s1) # Prints the text
	syscall
	
	la $a1, ($s0) # Puts the key into a0
	la $a2, ($s1) # Puts the text into a1
	jal encode # encode text
	
	# This will print the encoded word
	li $v0, 4
	la $a0, encodeis # Prints the prompt
	syscall
	li $v0, 4
	la $a0, encrypted # Prints the text
	syscall
	
	la $a1, ($s0) # Puts the key into a0
	la $a2, ($s1) # Puts the text into a1
	jal decode # decode text
	
	# This will print the encoded word
	li $v0, 4
	la $a0, decodeis # Prints the prompt
	syscall
	li $v0, 4
	la $a0, decrypted # Prints the text
	syscall
	
	li $v0, 10 # 10 is the exit syscall.
	syscall # do the syscall.
	
	
encode:
	move $t1, $a1 # Moves key into t1
	move $t2, $a2 # Moves text into t2
	la $a3, encrypted
	
	loop:
		lb $t3, ($t1) # Get the letter of key into t3
		lb $t4, ($t2) # Get the letter of text into t4
		beq $t4, '\0' end # if at the end of text, finished
		beq $t3, '\0' restart # if at the end of key, restart
		add $t5, $t3, $t4 # t5 is t3 + t4
		rem $t5, $t5, 128 # t5 is the encrypted letter
		sb $t5, ($a3) # Stores the character at a3
		add $a3, $a3, 1 # Goes to the next spot
		add $t1, $t1, 1 # Goes to the next letter in key
		add $t2, $t2, 1 # Goes to the next letter in text
		j loop
	restart: 
		move $t1, $a1
		lb $t3, ($t1) # Get the letter of key into t3
		add $t5, $t3, $t4 # t5 is t3 + t4
		rem $t5, $t5, 128 # t5 is the encrypted letter
		sb $t5, ($a3) # Stores the character at a3
		add $a3, $a3, 1 # Goes to the next spot
		add $t1, $t1, 1 # Goes to the next letter in key
		add $t2, $t2, 1 # Goes to the next letter in text
		j loop
	end:
	
	
	jr $ra

decode:
	move $t1, $a1 # Moves key into t1
	la $t2, encrypted # Moves addess of encrypted text into t2
	la $a3, decrypted
	
	dloop:
		
		lb $t3, ($t1) # Get the letter of key into t3
		lb $t4, ($t2) # Get the letter of text into t4
		beq $t4, '\0' dend # if at the end of text, finished
		beq $t3, '\0' drestart # if at the end of key, restart
		sub $t5, $t4, $t3 # t5 is t4 - t3
		remu $t5, $t5, 128 # t5 is the encrypted letter
		sb $t5, ($a3) # Stores the character at a3
		add $a3, $a3, 1 # Goes to the next spot
		add $t1, $t1, 1 # Goes to the next letter in key
		add $t2, $t2, 1 # Goes to the next letter in text
		j dloop
	drestart: 
		move $t1, $a1
		lb $t3, ($t1) # Get the letter of key into t3
		sub $t5, $t4, $t3 # t5 is t4 - t3
		remu $t5, $t5, 128 # t5 is the encrypted letter
		sb $t5, ($a3) # Stores the character at a3
		add $a3, $a3, 1 # Goes to the next spot
		add $t1, $t1, 1 # Goes to the next letter in key
		add $t2, $t2, 1 # Goes to the next letter in text
		j dloop
	dend:
	
	jr $ra

# Data for the program:
.data
encrypted: .space 101
decrypted: .space 101
keyis: .asciiz		"\nThe given key is: "
textis: .asciiz 	"\nThe given text is: "
encodeis: .asciiz 	"\nThe encrypted text is: "
decodeis: .asciiz 	"\nThe decrypted text is: "
