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
 
 