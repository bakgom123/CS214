
# birds.rb | Tests out the menagerie of bird classes.
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: David Yoo (gy24)
# Date: Mar 29, 2022
######################################################

require './Duck.rb'
require './Goose.rb'
require './Penguin.rb'
require './Ostrich.rb'
require './Kiwi.rb'


puts "\nWelcome to the Bird Park!\n\n"

bird0 = Duck.new "Donald"
bird0.print

bird1 = Penguin.new "Peter"
bird1.print

bird2 = Goose.new "Mother"
bird2.print

bird3 = Ostrich.new "Orville"
bird3.print

bird4 = Kiwi.new "Harry"
bird4.print

puts "\n\n"