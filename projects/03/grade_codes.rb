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

