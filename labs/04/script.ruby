Script started on 2022-02-02 09:59:41-05:00 [TERM="xterm-256color" TTY="/dev/pts/3" COLUMNS="142" LINES="12"]
]0;gy24@gold26: ~/cs214/labs/04[01;32mgy24@gold26[00m:[01;34m~/cs214/labs/04[00m$ cat c[KlogTable.rb
#! /usr/bin/ruby
# logTable.rb displays a table of logarithms
#
# Begun by: Prof. Adams, for CS 214 at Calvin College.
# Completed by: David Yoo (gy24)
#
# Input:  The start, stop and increment values
# Precondition: The start value is less than the stop value, 
#     and the increment is greater than 0
# Output: A table of logarithms from start to stop, with increment
#     as the step value


if __FILE__ == $0
   print "Enter the start value: "
#### ADD CODE HERE TO GET THESE VALUES AS NUMBERS
   start = gets.chomp.to_f
   print "Enter the stop value: "
####
   stop = gets.chomp.to_f
   print "Enter the increment value: "
####   
   increment = gets.chomp.to_f
   
#  Replace this line with a loop to display the log table 
while start <= stop do
	res = Math.log10(start)
	print "The logarithm of #{start} is #{res} \n"
	start = start + increment
   end
end


]0;gy24@gold26: ~/cs214/labs/04[01;32mgy24@gold26[00m:[01;34m~/cs214/labs/04[00m$ ruby logTable.rb
Enter the start value: 1
Enter the stop value: 2
Enter the increment value: 0.5
The logarithm of 1.0 is 0.0 
The logarithm of 1.5 is 0.17609125905568124 
The logarithm of 2.0 is 0.3010299956639812 
]0;gy24@gold26: ~/cs214/labs/04[01;32mgy24@gold26[00m:[01;34m~/cs214/labs/04[00m$ exit

Script done on 2022-02-02 10:00:11-05:00 [COMMAND_EXIT_CODE="0"]
