# Ostrich.rb | Defines the Ostrich class which inherits attributes and methods
#   from the Bird superclass.
#
# Created by: David Yoo (gy24)
# Date: Mar 29, 2022
####################################################

require './WalkingBird.rb'

class Ostrich < WalkingBird
    def call
        'Snork!'
    end



end