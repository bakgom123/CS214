Script started on 2022-01-26 10:42:20-05:00 [TERM="xterm-256color" TTY="/dev/pts/6" COLUMNS="142" LINES="12"]
]0;gy24@gold33: ~/cs214/labs/03[01;32mgy24@gold33[00m:[01;34m~/cs214/labs/03[00m$ cat year_codes.rbuby[2Pb
#! /usr/bin/ruby
# year_codes.rb translates an academic year into a numeric code
# Begun by: Dr. Nelesen, for CS 214 at Calvin College 
# Completed by: David Yoo (gy24)
# Date: 01/26/2022
################################################################

# Input:  The name of an academic year
# Precondition: The academic year is a string with a value of freshman, 
#   sophomore, junior or senior
# Output: The corresponding integer code for the given academic year

def yearCode year
	if year =~ /freshman/ then return 1
	elsif year =~ /sophomore/ then return 2
	elsif year =~ /junior/ then return 3
	elsif year =~ /senior/ then return 4
	else return 0
	end
end

if __FILE__ == $0
   print "Enter the year: "
   year = gets
   print "Numeric code is: "
   puts yearCode(year)
end

]0;gy24@gold33: ~/cs214/labs/03[01;32mgy24@gold33[00m:[01;34m~/cs214/labs/03[00m$ ruby uye[K[K[Kyear_codes.rb
Enter the year: freshman
Numeric code is: 1
]0;gy24@gold33: ~/cs214/labs/03[01;32mgy24@gold33[00m:[01;34m~/cs214/labs/03[00m$ ruby year_codes.rb
Enter the year: sophomore
Numeric code is: 2
]0;gy24@gold33: ~/cs214/labs/03[01;32mgy24@gold33[00m:[01;34m~/cs214/labs/03[00m$ ruby year_codes.rb
Enter the year: junior
Numeric code is: 3
]0;gy24@gold33: ~/cs214/labs/03[01;32mgy24@gold33[00m:[01;34m~/cs214/labs/03[00m$ ruby year_codes.rb
Enter the year: senior
Numeric code is: 4
]0;gy24@gold33: ~/cs214/labs/03[01;32mgy24@gold33[00m:[01;34m~/cs214/labs/03[00m$ exit

Script done on 2022-01-26 10:43:01-05:00 [COMMAND_EXIT_CODE="0"]
