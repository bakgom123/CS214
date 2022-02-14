Script started on 2022-01-26 10:43:15-05:00 [TERM="xterm-256color" TTY="/dev/pts/6" COLUMNS="142" LINES="12"]
]0;gy24@gold33: ~/cs214/labs/03[01;32mgy24@gold33[00m:[01;34m~/cs214/labs/03[00m$ cat[K[K[Kruby year_codes.rb[1Pcat[C[C[C[C[C[C[C[C[C[C[C[C[C[C[K[K[K[K[K[K[K[K[K[K[Kar_codes.adb
-- year_codes.adb converts academic year codes to corresponding years.
--
-- Begun by: Dr. Adams, for CS 214 at Calvin College.
-- Completed by: David Yoo (gy24)
--Date: 01/26/2022
--
-- Input: year, a string
-- Precondition: year is one of "freshman", "sophomore", "junior", "senior"
-- Output: The year code (1, 2, 3 or 4) corresponding to year.
----------------------------------------------------

with Ada.Text_IO, Ada.Integer_Text_IO;
use  Ada.Text_IO, Ada.Integer_Text_IO;

procedure year_codes is

   year : String(1..9) := "         ";
   charsRead : Natural;

   function yearCode(year : string) return integer is
   begin
      if year = "freshman " then
         return 1;
      elsif year = "sophomore" then
         return 2;
      elsif year = "junior   " then
         return 3;
      elsif year = "senior   " then
         return 4;
      else
         return 0;
      end if;
   end yearCode;

begin                                          
   Put("Enter your academic year: ");           -- Prompt for input
   Get_Line(year, charsRead);                   -- Input
   Put( yearCode(year) );                       -- Convert and output
   New_Line;
end year_codes;

]0;gy24@gold33: ~/cs214/labs/03[01;32mgy24@gold33[00m:[01;34m~/cs214/labs/03[00m$ gnatmake year_codes
x86_64-linux-gnu-gcc-7 -c year_codes.adb
x86_64-linux-gnu-gnatbind-7 -x year_codes.ali
x86_64-linux-gnu-gnatlink-7 year_codes.ali
]0;gy24@gold33: ~/cs214/labs/03[01;32mgy24@gold33[00m:[01;34m~/cs214/labs/03[00m$ ./year_codes
Enter your academic year: freshman
          1
]0;gy24@gold33: ~/cs214/labs/03[01;32mgy24@gold33[00m:[01;34m~/cs214/labs/03[00m$ ./year_codes
Enter your academic year: sopho omore
          2
]0;gy24@gold33: ~/cs214/labs/03[01;32mgy24@gold33[00m:[01;34m~/cs214/labs/03[00m$ ./year_codes
Enter your academic year: junior
          3
]0;gy24@gold33: ~/cs214/labs/03[01;32mgy24@gold33[00m:[01;34m~/cs214/labs/03[00m$ ./year_codes
Enter your academic year: senior
          4
]0;gy24@gold33: ~/cs214/labs/03[01;32mgy24@gold33[00m:[01;34m~/cs214/labs/03[00m$ exit

Script done on 2022-01-26 10:44:29-05:00 [COMMAND_EXIT_CODE="0"]
