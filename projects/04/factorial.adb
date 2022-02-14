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

end factorial;