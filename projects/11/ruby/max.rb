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
