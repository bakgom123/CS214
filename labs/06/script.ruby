Script started on 2022-02-18 01:07:26-05:00 [TERM="xterm-256color" TTY="/dev/pts/1" COLUMNS="271" LINES="12"]
]0;gy24@remotel1: ~/cs214/labs/06[01;32mgy24@remotel1[00m:[01;34m~/cs214/labs/06[00m$ cat split.rb
# split.rb splits a string into two substrings.
#
# Input: A string and an integer string position to split the string by.
# Precondition: The position integer is within the range of the string size.
# Output: The substrings aString(0, position - 1) and
#   aString(pos, length() - 1).
#
# Begun by: Prof. Adams, for CS 214 at Calvin College.
# Completed by: David Yoo (gy24)
# Date: Feb 18, 2022
#################################################################


# split() splits a string into its two substrings.
# Receive: aString, the string to be split,       
#        pos, the split position.                  
# PRE: 0 <= pos < the length of aString.
# Return: the substring of aString before pos, and  
#         the substring of aString from pos onwards.
######################################################

# Replace this line with the definition of split()
def split(aString, pos)
  [aString[0, pos], aString[pos..aString.size-1]]
end


def main
  print "To split a string, enter the string: "; 
  the_string = gets
  print "Enter the split position: "; 
  position = gets.to_i
  split_string = split(the_string, position)
  puts "The first part is: " << split_string[0]
  puts "and the second part is: " << split_string[1]
end

main
]0;gy24@remotel1: ~/cs214/labs/06[01;32mgy24@remotel1[00m:[01;34m~/cs214/labs/06[00m$ cat split.rb[5P./splitgnatmake split[K[K[K[K[K[K[K[K[K[K[K[K[K[Kruby split.rb
To split a string, enter the string: hello
Enter the split position: 0
The first part is: 
and the second part is: hello
]0;gy24@remotel1: ~/cs214/labs/06[01;32mgy24@remotel1[00m:[01;34m~/cs214/labs/06[00m$ ruby split.rb
To split a string, enter the string: hello
Enter the split position: 3
The first part is: hel
and the second part is: lo
]0;gy24@remotel1: ~/cs214/labs/06[01;32mgy24@remotel1[00m:[01;34m~/cs214/labs/06[00m$ ruby split.rb
To split a string, enter the string: hello
Enter the split position: 5
The first part is: hello
and the second part is: 
]0;gy24@remotel1: ~/cs214/labs/06[01;32mgy24@remotel1[00m:[01;34m~/cs214/labs/06[00m$ exit

Script done on 2022-02-18 01:08:27-05:00 [COMMAND_EXIT_CODE="0"]
