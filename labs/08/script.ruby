Script started on 2022-03-10 16:23:41-05:00 [TERM="xterm-256color" TTY="/dev/pts/0" COLUMNS="271" LINES="12"]
]0;gy24@remotel1: ~/cs214/labs/08[01;32mgy24@remotel1[00m:[01;34m~/cs214/labs/08[00m$ cat NameTester.rb
# NameTester.rb tests class Name and its operations
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: David Yoo (gy24)
# Date: Mar 10, 2022
####################################################

require 'test/unit/assertions'   # needed for assert
include Test::Unit::Assertions

# Replace this line with the declaration of class Name
class Name
   def initialize (first, middle, last)
      @first, @middle, @last = first, middle, last
   end
   attr_reader :first, :middle, :last
   def fullName
      @first + " " + @middle + " " + @last
   end
   def print
      puts fullName
      fullName
   end
end


def testName
  name = Name.new("John", "Paul", "Jones")

  assert name.first == "John", "first failed"
  assert name.middle == "Paul", "middle failed"
  assert name.last == "Jones", "last failed"
  assert name.fullName == "John Paul Jones", "fullName failed"
  assert name.print == "John Paul Jones", "print failed"
   
   print "All tests passed!\n"
end

testName

]0;gy24@remotel1: ~/cs214/labs/08[01;32mgy24@remotel1[00m:[01;34m~/cs214/labs/08[00m$ ruby NameTester.rb
John Paul Jones
All tests passed!
]0;gy24@remotel1: ~/cs214/labs/08[01;32mgy24@remotel1[00m:[01;34m~/cs214/labs/08[00m$ exit

Script done on 2022-03-10 16:24:10-05:00 [COMMAND_EXIT_CODE="0"]
