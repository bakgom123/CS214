Script started on 2022-01-26 14:36:40-05:00 [TERM="xterm-256color" TTY="/dev/pts/7" COLUMNS="101" LINES="12"]
]0;gy24@maroon25: ~/cs214/projects/03[01;32mgy24@maroon25[00m:[01;34m~/cs214/projects/03[00m$ cat sc[K[Kgrade_[K[Ke_codes.rb
#! /usr/bin/ruby
# grade_codes.rb translates score(an integer) to letter grade (a string) 
# Created by: David Yoo (gy24)
# Date: 01/26/2022
################################################################

# Input:  score in integer
# Precondition: score is a non-negative integer which is less than or equal to 100
# Output: The letter grade with some comments about your grade.
def gradeCode score
    case score / 10
        when 9..10 then 'A, Well Done!'
        when 8 then 'B, Try Harder!'
        when 7 then 'C, You need help!!!'
        when 6 then 'D, You just making it up!'
    else 'F, Disaster...'
	end
end

if __FILE__ == $0
   print "Enter the score: "
   score = gets
   print "Your letter grade is: "
   puts gradeCode(score.to_i)
end

]0;gy24@maroon25: ~/cs214/projects/03[01;32mgy24@maroon25[00m:[01;34m~/cs214/projects/03[00m$ ruby grade_codes.rb
Enter the score: 99
Your letter grade is: A, Well Done!
]0;gy24@maroon25: ~/cs214/projects/03[01;32mgy24@maroon25[00m:[01;34m~/cs214/projects/03[00m$ ruby grade_codes.rb
Enter the score: 88
Your letter grade is: B, Try Harder!
]0;gy24@maroon25: ~/cs214/projects/03[01;32mgy24@maroon25[00m:[01;34m~/cs214/projects/03[00m$ ruby grade_codes.rb
Enter the score: 77
Your letter grade is: C, You need help!!!
]0;gy24@maroon25: ~/cs214/projects/03[01;32mgy24@maroon25[00m:[01;34m~/cs214/projects/03[00m$ ruby grade_codes.rb
Enter the score: 66
Your letter grade is: D, You just making it up!
]0;gy24@maroon25: ~/cs214/projects/03[01;32mgy24@maroon25[00m:[01;34m~/cs214/projects/03[00m$ ruby grade_codes.rb
Enter the score: 55
Your letter grade is: F, Disaster...
]0;gy24@maroon25: ~/cs214/projects/03[01;32mgy24@maroon25[00m:[01;34m~/cs214/projects/03[00m$ 
]0;gy24@maroon25: ~/cs214/projects/03[01;32mgy24@maroon25[00m:[01;34m~/cs214/projects/03[00m$ exit

Script done on 2022-01-26 14:37:23-05:00 [COMMAND_EXIT_CODE="0"]
