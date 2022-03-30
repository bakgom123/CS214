Script started on Wed Mar 30 01:29:51 2022
[1m[7m%[27m[1m[0m                                                                                                                                                                                                                                                                                                                            [0m[27m[24m[Jyoogunju@yoogunju ruby % [K[?2004hccat Birdd .rb[?2004l
# Bird.rb | Defines a Bird superclass 
#   to be extended by specific bird sub-classes.
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: David Yoo (gy24)
# Date: Mar 29, 2022
####################################################

class Bird

    attr_reader :name

    def initialize(name)
        @name = name
    end

    def call
        'Squaaaaaaawk!'
    end

    def className
        self.class.to_s
    end

    def print
        puts name + className + " just " + movement + " and said, " + '"' + call + '"'
    end
  
end[1m[7m%[27m[1m[0m                                                                                                                                                                                                                                                                                                                            [0m[27m[24m[Jyoogunju@yoogunju ruby % [K[?2004hccat birds.rb[?2004l

# birds.rb | Tests out the menagerie of bird classes.
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: David Yoo (gy24)
# Date: Mar 29, 2022
######################################################

require './Bird.rb'
require './Duck.rb'
require './Goose.rb'
require './Owl.rb'
require './Penguin.rb'
require './Ostrich.rb'
require './Kiwi.rb'


puts "\nWelcome to the Bird Park!\n\n"

bird0 = Duck.new "Donald "
bird0.print

bird1 = Penguin.new "Peter "
bird1.print

bird2 = Goose.new "Mother "
bird2.print

bird3 = Ostrich.new "Orville "
bird3.print

bird4 = Kiwi.new "Harry "
bird4.print

puts "\n\n"[1m[7m%[27m[1m[0m                                                                                                                                                                                                                                                                                                                            [0m[27m[24m[Jyoogunju@yoogunju ruby % [K[?2004hccat Duck.rb[?2004l
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
    
end[1m[7m%[27m[1m[0m                                                                                                                                                                                                                                                                                                                            [0m[27m[24m[Jyoogunju@yoogunju ruby % [K[?2004hccat FlyingBird.rb[?2004l
# flying_bird.rb defines the behavior of a bird that flies.
# Author: David Yoo (gy24)
# Date: Mar 29, 2022

require './Bird.rb'

class FlyingBird < Bird
  # Get the movement of this bird.
  def movement
    return "flew past"
  end
end[1m[7m%[27m[1m[0m                                                                                                                                                                                                                                                                                                                            [0m[27m[24m[Jyoogunju@yoogunju ruby % [K[?2004hccat Goose.rb[?2004l
# Goose.rb | Defines the Goose class which inherits attributes and methods
#   from the Bird superclass.
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: David Yoo (gy24)
# Date: Mar 29, 2022
####################################################

require './FlyingBird.rb'

class Goose < FlyingBird
    def call
        'Honk!'
    end


end[1m[7m%[27m[1m[0m                                                                                                                                                                                                                                                                                                                            [0m[27m[24m[Jyoogunju@yoogunju ruby % [K[?2004hccat Kiwi.rb[?2004l
# Kiwi.rb | Defines the Kiwi class which inherits attributes and methods
#   from the Bird superclass.
#
# Created by: David Yoo (gy24)
# Date: Mar 29, 2022
####################################################

require './WalkingBird.rb'

class Kiwi < WalkingBird
    def call
        'Kiwiii!'
      end



end[1m[7m%[27m[1m[0m                                                                                                                                                                                                                                                                                                                            [0m[27m[24m[Jyoogunju@yoogunju ruby % [K[?2004hccat Ostrich.rb[?2004l
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



end[1m[7m%[27m[1m[0m                                                                                                                                                                                                                                                                                                                            [0m[27m[24m[Jyoogunju@yoogunju ruby % [K[?2004hccat Owl.rb[?2004l
# Owl.rb | Defines the Owl class which inherits attributes and methods
#   from the Bird superclass.
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: David Yoo (gy24)
# Date: Mar 29, 2022
####################################################

require './FlyingBird.rb'

class Owl < FlyingBird
    def call
        'Whoo-hoo!'
      end
    


end[1m[7m%[27m[1m[0m                                                                                                                                                                                                                                                                                                                            [0m[27m[24m[Jyoogunju@yoogunju ruby % [K[?2004hccat penguin.rb          Penguin.rb[?2004l
# Penguin.rb | Defines the Penguin class which inherits attributes and methods
#   from the Bird superclass.
#
# Created by: David Yoo (gy24)
# Date: Mar 29, 2022
####################################################

require './WalkingBird.rb'

class Penguin < WalkingBird
    def call
        'Huh-huh-huh-huuuuh!'
      end



end[1m[7m%[27m[1m[0m                                                                                                                                                                                                                                                                                                                            [0m[27m[24m[Jyoogunju@yoogunju ruby % [K[?2004hccat WalkingBird.rb[?2004l
# walking_bird.rb defines the behavior of a bird that walks.
# Author: David Yoo (gy24)
# Date: Mar 29,2022

require './bird.rb'

class WalkingBird < Bird
  # Get the movement of this bird.
  def movement
    return "walked past"
  end
end[1m[7m%[27m[1m[0m                                                                                                                                                                                                                                                                                                                            [0m[27m[24m[Jyoogunju@yoogunju ruby % [K[?2004hrrbr ruby birds.rb[?2004l

Welcome to the Bird Park!

Donald Duck just flew past and said, "Quack!"
Peter Penguin just walked past and said, "Huh-huh-huh-huuuuh!"
Mother Goose just flew past and said, "Honk!"
Orville Ostrich just walked past and said, "Snork!"
Harry Kiwi just walked past and said, "Kiwiii!"


[1m[7m%[27m[1m[0m                                                                                                                                                                                                                                                                                                                            [0m[27m[24m[Jyoogunju@yoogunju ruby % [K[?2004h[?2004l

Script done on Wed Mar 30 01:30:54 2022
