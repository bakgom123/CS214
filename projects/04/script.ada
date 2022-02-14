Script started on 2022-02-02 14:21:37-05:00 [TERM="xterm-256color" TTY="/dev/pts/9" COLUMNS="142" LINES="12"]
]0;gy24@gold32: ~/cs214/projects/04[01;32mgy24@gold32[00m:[01;34m~/cs214/projects/04[00m$ cat factorial.abd[K[Kdb
-- factorial.adb computes the factorial.
--
-- Input: integer - Number.
-- Output: The factorial of the integer Number.
--
-- Created by: David Yoo (gy24)
--------------------------------------------------------------

with Ada.Text_IO, Ada.Integer_Text_IO;
use  Ada.Text_IO, Ada.Integer_Text_IO;

procedure factorial is

   Number, Res : Integer;

   function fac_calc(Number: integer) return Integer is

   begin
	-- initialize the answer variable to be 1
	Res := 1;
	
	-- counting loop to calculate the factorial of the user-input number
	for I in Integer range 2 .. Number loop
		
		Res := Res * I;

	end loop;

	return Res;

   end fac_calc;

begin
   -- Prompt and receive the user for the integer value
   Put_Line("To calculate the factorial,");
   Put(" enter an integer: ");

   -- Receive the number from the user
   get(Number);

   -- Output the factorial of the given input integer
   Put("The factorial of ");
   Put(Number);
   Put(" is ");
   Put(fac_calc(Number));

end factorial;]0;gy24@gold32: ~/cs214/projects/04[01;32mgy24@gold32[00m:[01;34m~/cs214/projects/04[00m$ gnatmake factorial
x86_64-linux-gnu-gcc-7 -c factorial.adb
x86_64-linux-gnu-gnatbind-7 -x factorial.ali
x86_64-linux-gnu-gnatlink-7 factorial.ali
]0;gy24@gold32: ~/cs214/projects/04[01;32mgy24@gold32[00m:[01;34m~/cs214/projects/04[00m$ ./factorial
To calculate the factorial,
 enter an integer: 5
The factorial of           5 is         120
]0;gy24@gold32: ~/cs214/projects/04[01;32mgy24@gold32[00m:[01;34m~/cs214/projects/04[00m$ exit

Script done on 2022-02-02 14:22:12-05:00 [COMMAND_EXIT_CODE="0"]
