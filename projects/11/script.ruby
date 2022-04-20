Script started on 2022-04-05 02:00:33-04:00 [TERM="xterm-256color" TTY="/dev/pts/0" COLUMNS="271" LINES="17"]
]0;gy24@remotel1: ~/cs214/projects/11/ruby[01;32mgy24@remotel1[00m:[01;34m~/cs214/projects/11/ruby[00m$ cat List.rb
# List.rb implements a linked list structure in Ruby.
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: David Yoo (gy24)
# Date: Apr 5, 2022
#######################################################

require 'test/unit/assertions'
include Test::Unit::Assertions

class List

   # initialize a List to be empty
   # Postcondition: first == nil and last == nil and length == 0

   # Replace this line with a List constructor definition
   def initialize
      @first = nil
      @last = nil
      @length = 0
   end
   


   # create reader method for length

   # Replace this line with a statement to define a 'length' reader method
   attr_reader :length

   # Am I empty?
   # Return: length == 0
   def empty?
      @length == 0
   end
  
   # append a value to me
   # Receive: value, the item to be appended
   # Postcondition: my last item is value and
   #                 my length is one more than it was
   def append(value)
      newNode = Node.new(value, nil)

      if empty?
         @first = newNode
      else
         @last.next = newNode      
      end

      @last = newNode
      @length += 1
      self
   end


   # print my items
   # Postcondition: my items have been displayed to the screen

   # Replace this line with a definition for method 'print'
   def print
      temp = @first
      while !temp.nil?
         printf " #{temp.value}"
         temp = temp.next
      end
   end


   # find my maximum item
   # Return: my maximum item

   # Replace this line with a definition for method 'max'
   def max
      temp = @first
      maxValue = -999999
      while !temp.nil?
         if temp.value > maxValue then
            maxValue = temp.value
         end
         temp = temp.next
      end
      return maxValue
   end

   def find(value)
      temp = @first
      i = 0
      while !temp.nil?
         if temp.value == value
            return i
         end
         temp = temp.next
         i += 1
      end
      return -1
   end
      


   # Replace this line with a declaration for class Node
   #  (and its methods)
   class Node
      def initialize(item, link)
         @value = item
         @next = link
      end

      attr_reader :value
      attr_accessor :next
   end

end

]0;gy24@remotel1: ~/cs214/projects/11/ruby[01;32mgy24@remotel1[00m:[01;34m~/cs214/projects/11/ruby[00m$ cat max.rbn[K
# max.rb tests a Ruby linked list.
#
# Begun by: Dr. Adams for CS 214 at Calvin College.
# Completed by: David Yoo (gy24)
# Date: Apr 5, 2022

require './List'

list1 = List.new
list2 = List.new
list3 = List.new
list4 = List.new

list1.append(99).append(88).append(77).append(66).append(55)
list2.append(55).append(66).append(77).append(88).append(99)
list3.append(55).append(77).append(99).append(88).append(66)
list4.append(55).append(77).append(11).append(88).append(66)

list1.print 
puts
puts "Maximum of list1: #{list1.max}"
puts "Index of 99 in list1:  #{list1.find(99)}"

list2.print 
puts
puts "Maximum of list2: #{list2.max}"
puts "Index of 99 in list2:  #{list2.find(99)}"

list3.print 
puts
puts "Maximum of list3: #{list3.max}"
puts "Index of 99 in list3:  #{list3.find(99)}"

list4.print 
puts
puts "Maximum of list4: #{list4.max}"
puts "Index of 99 in list4:  #{list4.find(99)}"
]0;gy24@remotel1: ~/cs214/projects/11/ruby[01;32mgy24@remotel1[00m:[01;34m~/cs214/projects/11/ruby[00m$ ruby max.rb
 99 88 77 66 55
Maximum of list1: 99
Index of 99 in list1:  0
 55 66 77 88 99
Maximum of list2: 99
Index of 99 in list2:  4
 55 77 99 88 66
Maximum of list3: 99
Index of 99 in list3:  2
 55 77 11 88 66
Maximum of list4: 88
Index of 99 in list4:  -1
]0;gy24@remotel1: ~/cs214/projects/11/ruby[01;32mgy24@remotel1[00m:[01;34m~/cs214/projects/11/ruby[00m$ exit

Script done on 2022-04-05 02:00:54-04:00 [COMMAND_EXIT_CODE="0"]
