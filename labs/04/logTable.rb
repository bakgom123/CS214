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


