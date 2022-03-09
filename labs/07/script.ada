Script started on 2022-02-22 23:53:37-05:00 [TERM="xterm-256color" TTY="/dev/pts/0" COLUMNS="271" LINES="12"]
]0;gy24@remotel3: ~/cs214/labs/07[01;32mgy24@remotel3[00m:[01;34m~/cs214/labs/07[00m$ cat average.adb
-- average.adb "test-drives" function Average.
-- Precondition: theArray is an array of numbers.
-- Output: the average of the numbers.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: David Yoo (gy24)
-- Date: Feb 22, 2022
-----------------------------------------------

with Ada.Text_IO; use Ada.Text_IO;             -- Put(String)
with Ada.Float_Text_IO; use Ada.Float_Text_IO; -- Put(Float)

procedure average is

-- Declare Vector type
type Vector is array (Positive range<>) of Float;

-- Define array0 as an array containing no values
array0 : Vector := (0.0, 0.0);
-- Define array1 as an array containing 9, 8, 7, 6
array1 : Vector := (9.0, 8.0, 7.0, 6.0);
----------------------------------------------
-- sum() sums the values in an array           -
-- Receive: anArray, an array of numbers     -
-- Return: the sum of the values in anArray. -
----------------------------------------------

-- Replace this line with definition of sum()
 function sum(A: Vector) return Float is 
    Total : Float := 0.0; 
  begin 
    for I in A'Range 
    loop 
      Total := Total + A(I); 
    end loop; 
    return Total; 
  end sum;

-- Replace this line with documentation and definition of average()
 function average(B: Vector) return Float is  
   begin 
    if B'length = 0 then
      return 0.0;
    else
      return sum(B) / Float(B'length);
    end if;
   end average;

begin
   Put(" average 0 is ");
   Put( average(array0) );
   New_line;
   Put(" average 1 is ");
   Put( average(array1) );
   New_line;
end average;

]0;gy24@remotel3: ~/cs214/labs/07[01;32mgy24@remotel3[00m:[01;34m~/cs214/labs/07[00m$ gnatmake aveage[K[K[Krage
gnatmake: "average" up to date.
]0;gy24@remotel3: ~/cs214/labs/07[01;32mgy24@remotel3[00m:[01;34m~/cs214/labs/07[00m$ ./avear[K[Krage
 average 0 is  0.00000E+00
 average 1 is  7.50000E+00
]0;gy24@remotel3: ~/cs214/labs/07[01;32mgy24@remotel3[00m:[01;34m~/cs214/labs/07[00m$ exit

Script done on 2022-02-22 23:54:21-05:00 [COMMAND_EXIT_CODE="0"]
