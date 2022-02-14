Script started on 2022-02-02 09:57:38-05:00 [TERM="xterm-256color" TTY="/dev/pts/3" COLUMNS="142" LINES="12"]
]0;gy24@gold26: ~/cs214/labs/04[01;32mgy24@gold26[00m:[01;34m~/cs214/labs/04[00m$ cat log_table.adb
-- log_table.adb computes a table of logarithms.
--
-- Input: start, stop, increment, three reals.
-- Precondition: increment is positive.
-- Output: A table of logarithms beginning with log(start),
--         ending with log(stop), with intervals of increment.
--
-- Begun by: Prof. Adams, for CS 214 at Calvin College.
-- Completed by:
--------------------------------------------------------------

with Ada.Text_IO, Ada.Float_Text_IO, Ada.Numerics.Elementary_Functions;
use  Ada.Text_IO, Ada.Float_Text_IO, Ada.Numerics.Elementary_Functions;


procedure log_table is

   Start, Stop, Increment : Float;

begin                                           -- Prompt for input
   Put_Line("To print a table of logarithms,");
   Put(" enter the start, stop, and increment values: ");
   Get(Start); Get(Stop); Get(Increment);

   -- Replace this line with a loop to generate the table of logs.
   while Start <= Stop loop
      Put("The logarithm of");
      Put(Start);
      Put("is ");
      Put( log(Start, 10.0) );
      New_Line;
      Start := Start + Increment;
   end loop;
   

end log_table;

]0;gy24@gold26: ~/cs214/labs/04[01;32mgy24@gold26[00m:[01;34m~/cs214/labs/04[00m$ gnatmake log_table
x86_64-linux-gnu-gcc-7 -c log_table.adb
x86_64-linux-gnu-gnatbind-7 -x log_table.ali
x86_64-linux-gnu-gnatlink-7 log_table.ali
]0;gy24@gold26: ~/cs214/labs/04[01;32mgy24@gold26[00m:[01;34m~/cs214/labs/04[00m$ ./log_table
To print a table of logarithms,
 enter the start, stop, and increment values: 1
2
0.5
The logarithm of 1.00000E+00is  0.00000E+00
The logarithm of 1.50000E+00is  1.76091E-01
The logarithm of 2.00000E+00is  3.01030E-01
]0;gy24@gold26: ~/cs214/labs/04[01;32mgy24@gold26[00m:[01;34m~/cs214/labs/04[00m$ exit

Script done on 2022-02-02 09:58:32-05:00 [COMMAND_EXIT_CODE="0"]
