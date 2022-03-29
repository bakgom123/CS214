# Goose.rb | Defines the Goose class which inherits attributes and methods
#   from the Bird superclass.
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: David Yoo (gy24)
# Date: Mar 24, 2022
####################################################

require './Bird.rb'

class Goose < Bird
    def call
        'Honk!'
      end
    
      def className
        self.class.to_s
      end
    
      def print
        puts name + className + " says " + call
      end


end