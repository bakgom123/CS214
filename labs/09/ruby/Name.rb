# Name.rb has the module Names
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: David Yoo (gy24)
# Date: Mar 17, 2022
####################################################

module Names
    class Name
      def initialize(first, middle, last)
        @first, @middle, @last = first, middle, last
      end
  
      attr_reader :first, :middle, :last
  
      def fullName
        @first + " " + @middle + " " + @last
      end
  
      def print
        puts fullName
        fullName
      end
    end
  end