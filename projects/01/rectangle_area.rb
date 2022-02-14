#! /usr/bin/ruby
# circle_area.rb computes the area of a circle given its radius
# 
# Input: the width and the height of a rectangle
# Precondition: the width and height are positive
# Output: the area of the rectangle.
#
# Begun by: Prof. Adams, for CS 214 at Calvin College.
# Completed by: David Yoo (gy24)
# Date: 1/14/2022
###############################################################

# function rectangleArea returns a rectangle's area, given its width and height
# Parameters: w, h, a number
# Precondition: w and h are positive.
# Returns: the area of a rectangle whose width is w and height is h.

def rectangleArea(w,h)
    w*h
end

if __FILE__ == $0
   puts "To compute the area of a circle,"
   print " enter its width: "
   width = gets.chomp.to_f
   print " enter its height: "
   height = gets.chomp.to_f
   print "The rectangle's area is: "
   puts rectangleArea(width, height)
end