Script started on 2022-01-14 16:49:27-05:00 [TERM="xterm-256color" TTY="/dev/pts/2" COLUMNS="80" LINES="24"]
]0;gy24@gold32: ~/cs214/projects/01[01;32mgy24@gold32[00m:[01;34m~/cs214/projects/01[00m$ cat rectangle_area.rb
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
end]0;gy24@gold32: ~/cs214/projects/01[01;32mgy24@gold32[00m:[01;34m~/cs214/projects/01[00m$ ruby rectangle_area.rb
To compute the area of a circle,
 enter its width: 1
 enter its height: 1
The rectangle's area is: 1.0
]0;gy24@gold32: ~/cs214/projects/01[01;32mgy24@gold32[00m:[01;34m~/cs214/projects/01[00m$ ruby rectangle_area.rb
To compute the area of a circle,
 enter its width: 2
 enter its height: 3
The rectangle's area is: 6.0
]0;gy24@gold32: ~/cs214/projects/01[01;32mgy24@gold32[00m:[01;34m~/cs214/projects/01[00m$ ruby rectangle_area.rb
To compute the area of a circle,
 enter its width: 12
 enter its height: 14
The rectangle's area is: 168.0
]0;gy24@gold32: ~/cs214/projects/01[01;32mgy24@gold32[00m:[01;34m~/cs214/projects/01[00m$ exit
exit

Script done on 2022-01-14 16:50:05-05:00 [COMMAND_EXIT_CODE="0"]
