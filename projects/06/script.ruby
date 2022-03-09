Script started on 2022-03-05 03:01:22-05:00 [TERM="xterm-256color" TTY="/dev/pts/1" COLUMNS="256" LINES="12"]
]0;gy24@remotel1: ~/cs214/projects/06[01;32mgy24@remotel1[00m:[01;34m~/cs214/projects/06[00m$ cat root.rb
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
  
  # Main driver
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
  end]0;gy24@remotel1: ~/cs214/projects/06[01;32mgy24@remotel1[00m:[01;34m~/cs214/projects/06[00m$ cat root.rb[2Pjava Rootc -deprecation Root.java[15Pcat[C[C[C[C[C[C[C[C[C[Csudo apt-get install apt-src[15Pcat Root.java[15@javac -deprecation[C[C[C[C[C[C[C[C[C[C Root[Kcat root.rb[Kcat root.rb[K[K[K[K[K[K[K[K[K[K[Kruby root.rb
Please enter a: 1
Please enter b: 2
Please enter c: 3
b^2 - 4ac is negative!]0;gy24@remotel1: ~/cs214/projects/06[01;32mgy24@remotel1[00m:[01;34m~/cs214/projects/06[00m$ ruby root.rb
Please enter a: 1
Please enter b: 5
Please enter c: 1
-0.20871215252208009, -4.7912878474779195]0;gy24@remotel1: ~/cs214/projects/06[01;32mgy24@remotel1[00m:[01;34m~/cs214/projects/06[00m$ exit

Script done on 2022-03-05 03:01:52-05:00 [COMMAND_EXIT_CODE="0"]
