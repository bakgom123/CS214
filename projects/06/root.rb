#! /usr/bin/ruby
# Root.java computes the roots of the quadratic equation. (ax^2+bx+c)
# Created by: David Yoo (gy24)
# Date: Mar 05, 2022


# Subprogram: Function for calculating the root
def quadraticRoots(a, b, c)
    if a != 0
      arg = (b ** 2.0) - (4*a*c)
      if arg >= 0
        root1 = (-b + Math.sqrt(arg)) / (2*a);
        root2 = (-b - Math.sqrt(arg)) / (2*a);
        return true, root1, root2
      else
        print "b^2 - 4ac is negative!"
        return false, 0.0, 0.0
      end
    else
      print "a is zero!"
      return false, 0.0, 0.0
    end
  end
  
  # Main function
  if __FILE__ == $0
    print "Please enter a: "
    a = gets.chomp.to_f
    print "Please enter b: " 
    b = gets.chomp.to_f
    print "Please enter c: "
    c = gets.chomp.to_f
  
    roots, root1, root2 = quadraticRoots(a, b, c)
    if roots
      print "#{root1}, #{root2}"
    end
  end