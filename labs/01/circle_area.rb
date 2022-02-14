#! /usr/bin/ruby
# circle_area.rb computes the area of a circle given its radius
# 
# Input: the radius of a circle
# Precondition: the radius is not negative
# Output: the area of the circle.
#
# Begun by: Prof. Adams, for CS 214 at Calvin College.
# Completed by: David Yoo (gy24)
# Date: 1/13/2022
###############################################################

# function circleArea returns a circle's area, given its radius
# Parameters: r, a number
# Precondition: r > 0.
# Returns: the area of a circle whose radius is r.
PI = 3.1415927 # define and set the value for PI
def circleArea(r) # create the function called circleArea to calculate the area of the circle with certain radius r
    PI * r ** 2 
end 

if __FILE__ == $0 # if this file is the main file being used, then run the following code.
   puts "To compute the area of a circle," # outputs this line with the new line after this
   print " enter its radius: " # print out this line without printing out the new line after this
   radius = gets.chomp.to_f # gets the float number from the user to put in as the value of radius
   print "The circle's area is: " # print out this line without printing out the new line after this
   puts circleArea(radius) # calls the function circleArea to print out the area of the circle with the user input of radius
end