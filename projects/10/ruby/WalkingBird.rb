# walking_bird.rb defines the behavior of a bird that walks.
# Author: David Yoo (gy24)
# Date: Mar 29,2022

require './bird.rb'

class WalkingBird < Bird
  # Get the movement of this bird.
  def movement
     " walked past"
  end
end