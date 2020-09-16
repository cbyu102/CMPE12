Your Lab 5 work *must* be done in this directory.

Crystal Yu (cbyu@ucsc.edu)
Lab 3: Decimal Converter
Section: 01F - Justin Lee
Due: 11/1/17

Purpose:
	The purpose of this lab is to practice using assembly language. We took the program arguments and used
the first given as a key and encrypted the second string given. We practiced manipulating arrays and using
functions.

Methods:
	The main pieces of code in this program are the encode and decode functions. The decode function was
essentially the same as the encode function. The only difference was that instead of adding the key to the
original string, it was subtracting the key from the string before getting the modulus of 128. The functions
loop through all the characters both the string and key inorder to encrypt and decrypt it. 

Results:
	At first, my code only worked when I was overriding the original string given with the encrypted
version and then that one with the decrypted version. Then after making arrays, for some reason it didn't work.
It turns out I was loading the word as an address and that messed everything up. Othere than that, most of
the coding went smoothly.

Analysis:
	Since functions can override my registers, I just decided use specific registers for specific values.
I didn't have to save anything other than the encrypted array and decrypted array. I used $s0 specifically
as the key only and $s1 as the original input only. I used the temporary registers for calculations. And
lastly, I used $a1 - $a3 as arguments that the function would use ($a1 was the key, $a2 was the encrypted/
decrypted string, and $a3 was the address of the array where I would place the encrypted/decrypted word). This
way, I didn't have to save any important values since I wasn't overriding them. I do override the temporary
and argument registers but that was after I had finished using the original values and they were no longer
useful.