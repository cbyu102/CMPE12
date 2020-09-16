Crystal Yu (cbyu@ucsc.edu)
Lab 3: Decimal Converter
Section: 01F - Justin Lee
Due: 11/1/17

Purpose:
	The purpose of this lab is to learn and practice assembly language. We also learned how to convert
a user inputed string into an integer and then printed it out as a binary number.

Methods:
	By using simple loads and loops, I was able to convert the user input into an integer. First, I took
the address where the string was stored and looped through it character by character and converted each
digit into an integer. After obtaining the integer, depending on if it was negative or not, I converted it
to a 2s compliment. After that, using the AND function, I was able to loop through every digit in the binary
to check to see if it was a 1 or 0 and printed a number respectively.

Results:
	It works. At first, it couldn't convert the lowest possible number into a binary. It couldn't even
store it. But then by changing the add so that it is unsigned, it was able to fit. In the beginning I had
no idea how assembly worked. I often got confused on what the values stored were. Eventually, I could
keep track of the different stored values and figure out if the value stored was an address or an actual 
value that I was going to use. Also, at first, all the different load functions were confusing. I didn't
really understand the arguements and whether it was a value or an address. As time went on and I used the
functions more, it became easier to differentiate.

Analysis:
	Originally my code spanned from lines 10 to 80. Since we used pseudo-ops, there were 9 more lines
that assembly ran, if I counted correctly. Most of them came from when I was using the math functions like
addition or subtraction. The others came from when I was loading the strings so I could print it out. I
mostly designed my algorithm in a linear fashion. I started small and began by just making sure I was able
to input the number correctly. I would always include extra print functions as I was writing to make sure
that it was clear what my registers contained the correct values. When I was able to be sure that I could
loop through the string, I wrote the code to convert it into an integer. I continued doing the lab piece
by piece until I finished. I feel that it was significantly easier to write by breaking it up into pieces
and checking if each piece functioned before putting it all together. Also since assembly is so hard to read,
I wrote many comments so I could keep track of what I was doing and what that line does. Normally, like
in java, I don't write that many comments, but I think it is a good way to make your code really clear. I
feel like I can easily read through my code and understand what it is doing.