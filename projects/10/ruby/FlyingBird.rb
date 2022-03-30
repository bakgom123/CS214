# flying_bird.rb defines the behavior of a bird that flies.
# Author: David Yoo (gy24)
# Date: Mar 29, 2022

require './Bird.rb'

class FlyingBird < Bird
  # Get the movement of this bird.
  def movement
    " flew past"
  end
end