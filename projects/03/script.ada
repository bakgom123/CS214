Script started on 2022-01-26 14:35:30-05:00 [TERM="xterm-256color" TTY="/dev/pts/7" COLUMNS="101" LINES="12"]
]0;gy24@maroon25: ~/cs214/projects/03[01;32mgy24@maroon25[00m:[01;34m~/cs214/projects/03[00m$ cat grade_codes.ada[Kb
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

]0;gy24@maroon25: ~/cs214/projects/03[01;32mgy24@maroon25[00m:[01;34m~/cs214/projects/03[00m$ gnatmake grade_codes
gnatmake: "grade_codes" up to date.
]0;gy24@maroon25: ~/cs214/projects/03[01;32mgy24@maroon25[00m:[01;34m~/cs214/projects/03[00m$ ./grade_codes
Enter your score: 98
A
]0;gy24@maroon25: ~/cs214/projects/03[01;32mgy24@maroon25[00m:[01;34m~/cs214/projects/03[00m$ ./grade_codes
Enter your score: 88
B
]0;gy24@maroon25: ~/cs214/projects/03[01;32mgy24@maroon25[00m:[01;34m~/cs214/projects/03[00m$ ./grade_codes
Enter your score: 77
C
]0;gy24@maroon25: ~/cs214/projects/03[01;32mgy24@maroon25[00m:[01;34m~/cs214/projects/03[00m$ ./grade_codes
Enter your score: 66
D
]0;gy24@maroon25: ~/cs214/projects/03[01;32mgy24@maroon25[00m:[01;34m~/cs214/projects/03[00m$ ./grade_codes
Enter your score: 55
F
]0;gy24@maroon25: ~/cs214/projects/03[01;32mgy24@maroon25[00m:[01;34m~/cs214/projects/03[00m$ exit

Script done on 2022-01-26 14:36:20-05:00 [COMMAND_EXIT_CODE="0"]
