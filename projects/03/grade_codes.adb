-- grade_codes.adb converts scores to letter grades.
--
-- Created by: David Yoo (gy24)
-- Date: 01/26/2022
--
-- Input: score, an integer
-- Precondition: score is non-negative integer.
-- Output: The letter grade (A, B, C, D or F) corresponding to score.
----------------------------------------------------

with Ada.Text_IO, Ada.Integer_Text_IO;
use  Ada.Text_IO, Ada.Integer_Text_IO;

procedure grade_codes is

   score : integer:= 0;

   function gradeCode(score : integer) return character is
   begin
        case score / 10 is
            when 10 | 9 => return 'A';
            when 8 => return 'B';
            when 7 => return 'C';
            when 6 => return 'D';
            when others => return 'F';
        end case;
   end gradeCode;

begin                                          
   Put("Enter your score: ");           -- Prompt for input
   Get(score);                   -- Input
   Put( gradeCode(score) );                       -- Convert and output
   New_Line;
end grade_codes;

