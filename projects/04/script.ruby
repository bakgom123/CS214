Script started on 2022-02-02 14:19:26-05:00 [TERM="xterm-256color" TTY="/dev/pts/9" COLUMNS="142" LINES="12"]
]0;gy24@gold32: ~/cs214/projects/04[01;32mgy24@gold32[00m:[01;34m~/cs214/projects/04[00m$ cat factorial.rb
#! /usr/bin/ruby
# factorial.rb computes the factorial
# Completed by: David Yoo (gy24)
#
# Input:  An integer n
# Output: The factorial of the integer n.

# Function for calculating the factorial
def fac_calc n
	res = 1
	for i in 2..n
		res *= i
	end
	return res
end

if __FILE__ == $0
	print "Enter an integer to calculate the factorial: "
 	#To get the integer from the user as number
	n = gets.chomp.to_f
	#Save the factorial value to res
	res = fac_calc(n)
	print "The factorial of #{n} is #{res}\n"
end
 
 ]0;gy24@gold32: ~/cs214/projects/04[01;32mgy24@gold32[00m:[01;34m~/cs214/projects/04[00m$ ruby factorial.rb
Enter an integer to calculate the factorial: 5
The factorial of 5.0 is 120
]0;gy24@gold32: ~/cs214/projects/04[01;32mgy24@gold32[00m:[01;34m~/cs214/projects/04[00m$ exit

Script done on 2022-02-02 14:19:45-05:00 [COMMAND_EXIT_CODE="0"]
