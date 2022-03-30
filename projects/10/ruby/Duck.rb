# Duck.rb | Defines the Duck class which inherits attributes and methods
#   from the Bird superclass.
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: David Yoo (gy24)
# Date: Mar 29, 2022
####################################################

require './FlyingBird.rb'

class Duck < FlyingBird
    def call
        'Quack!'
    end
    
end