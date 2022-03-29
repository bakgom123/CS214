Script started on 2022-03-17 15:04:44-04:00 [TERM="xterm-256color" TTY="/dev/pts/0" COLUMNS="151" LINES="12"]
]0;gy24@gold30: ~/cs214/labs/09/ruby[01;32mgy24@gold30[00m:[01;34m~/cs214/labs/09/ruby[00m$ cat Name.rb
# Name.rb has the module Names
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: David Yoo (gy24)
# Date: Mar 17, 2022
####################################################

module Names
    class Name
      def initialize(first, middle, last)
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
  end]0;gy24@gold30: ~/cs214/labs/09/ruby[01;32mgy24@gold30[00m:[01;34m~/cs214/labs/09/ruby[00m$ cat nameTester.rb
# nameTester.rb tests class Name and its operations
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: David Yoo (gy24)
# Date: Mar 17, 2022
####################################################

require './Name'
require 'test/unit/assertions'
include Test::Unit::Assertions

def testName
   name = Names::Name.new("John", "Paul", "Jones")

   assert name.first == "John", 
           "first failed"
   assert name.middle == "Paul",
           "middle failed"
   assert name.last == "Jones",
           "last failed"
   assert name.fullName == "John Paul Jones",
           "fullName failed"
   assert name.print == "John Paul Jones",
           "print failed"
   
   print "All tests passed!\n"
end

testName
]0;gy24@gold30: ~/cs214/labs/09/ruby[01;32mgy24@gold30[00m:[01;34m~/cs214/labs/09/ruby[00m$ ruby nameTester.rb
John Paul Jones
All tests passed!
]0;gy24@gold30: ~/cs214/labs/09/ruby[01;32mgy24@gold30[00m:[01;34m~/cs214/labs/09/ruby[00m$ exit

Script done on 2022-03-17 15:05:07-04:00 [COMMAND_EXIT_CODE="0"]
