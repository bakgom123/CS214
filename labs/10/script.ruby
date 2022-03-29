Script started on 2022-03-24 14:42:03-04:00 [TERM="xterm-256color" TTY="/dev/pts/0" COLUMNS="151" LINES="17"]
]0;gy24@gold32: ~/cs214/labs/10/ruby[01;32mgy24@gold32[00m:[01;34m~/cs214/labs/10/ruby[00m$ cat Bird.rb
# Bird.rb | Defines a Bird superclass 
#   to be extended by specific bird sub-classes.
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: David Yoo (gy24)
# Date: Mar 24, 2022
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
        puts name + className + " says " + call
    end
  
end]0;gy24@gold32: ~/cs214/labs/10/ruby[01;32mgy24@gold32[00m:[01;34m~/cs214/labs/10/ruby[00m$ cat Duck.rb
# Duck.rb | Defines the Duck class which inherits attributes and methods
#   from the Bird superclass.
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: David Yoo (gy24)
# Date: Mar 24, 2022
####################################################

require './Bird.rb'

class Duck < Bird
    def call
        'Quack!'
      end
    
      def className
        self.class.to_s
      end
    
      def print
        puts name + className + " says " + call
      end


end]0;gy24@gold32: ~/cs214/labs/10/ruby[01;32mgy24@gold32[00m:[01;34m~/cs214/labs/10/ruby[00m$ C[Kcat Goose.rb
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


end]0;gy24@gold32: ~/cs214/labs/10/ruby[01;32mgy24@gold32[00m:[01;34m~/cs214/labs/10/ruby[00m$ cat Owl.rb
# Owl.rb | Defines the Owl class which inherits attributes and methods
#   from the Bird superclass.
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: David Yoo (gy24)
# Date: Mar 24, 2022
####################################################

require './Bird.rb'

class Owl < Bird
    def call
        'Whoo-hoo!'
      end
    
      def className
        self.class.to_s
      end
    
      def print
        puts name + className + " says " + call
      end


end]0;gy24@gold32: ~/cs214/labs/10/ruby[01;32mgy24@gold32[00m:[01;34m~/cs214/labs/10/ruby[00m$ cat birds.rb

# birds.rb | Tests out the menagerie of bird classes.
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: David Yoo (gy24)
# Date: Mar 24, 2022
######################################################

require './Bird.rb'
require './Duck.rb'
require './Goose.rb'
require './Owl.rb'

puts "\nWelcome to the Bird Park!\n\n"

bird0 = Bird.new "Hawkeye"
bird0.print

bird1 = Duck.new "Donald"
bird1.print

bird2 = Goose.new "Mother"
bird2.print

bird3 = Owl.new "Woodsey"
bird3.print

puts "\n\n"]0;gy24@gold32: ~/cs214/labs/10/ruby[01;32mgy24@gold32[00m:[01;34m~/cs214/labs/10/ruby[00m$ cat birds.rb[2POwl.rbGoose.rb[1PDuck.rbBird.rblojure -m birds[3Pat birds.clj[2POwl.clj[K[K[K[K[K[K[K[K[K[K[Kruby birds.rb

Welcome to the Bird Park!

HawkeyeBird says Squaaaaaaawk!
DonaldDuck says Quack!
MotherGoose says Honk!
WoodseyOwl says Whoo-hoo!


]0;gy24@gold32: ~/cs214/labs/10/ruby[01;32mgy24@gold32[00m:[01;34m~/cs214/labs/10/ruby[00m$ exit

Script done on 2022-03-24 14:42:38-04:00 [COMMAND_EXIT_CODE="0"]
