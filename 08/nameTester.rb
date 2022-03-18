# NameTester.rb tests class Name and its operations
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: David Yoo (gy24)
# Date: Mar 15, 2022
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
   def lfmi
    return @last + ", " + @first + " " + @middle[0]
   end
   def readName
    @first = gets.chomp
    @middle = gets.chomp
    @last = gets.chomp
   end
   attr_accessor :first, :middle, :last
end


def testName
  name = Name.new("John", "Paul", "Jones")

  assert name.first == "John", "first failed"
  assert name.middle == "Paul", "middle failed"
  assert name.last == "Jones", "last failed"
  assert name.fullName == "John Paul Jones", "fullName failed"
  assert name.print == "John Paul Jones", "print failed"

  assert name.first = "David"
  assert name.first == "David", "setting first name failed"
  assert name.middle = "Gunju"
  assert name.middle == "Gunju", "setting middle name failed"
  assert name.last = "Yoo"
  assert name.last == "Yoo", "setting last name failed"

  assert name.lfmi == "Yoo, David G", "lfmi failed"
   
  print "All tests passed!\n"
  print "Please enter your first, middle, last name and press enter each time you enter your name):"
  name.readName
  puts name.fullName
end

testName

