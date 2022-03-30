-- Tester of temperature package, and it has the main function
-- Author: David Yoo (gy24)
-- Date: 03/23/2020

with Ada.Text_IO, Ada.Float_Text_IO, Temperature_Package;
use Ada.Text_IO, Ada.Float_Text_IO, Temperature_Package;

procedure Temperature_Tester is
   Start: Temperature_Package.Temperature;
   Stop: Temperature_Package.Temperature;
   Step: Float;
   Error: Boolean := False;
   Current: Temperature_Package.Temperature;
begin
   Put("Temperature examples:"); New_Line;
   Put("20.5 C"); New_Line;
   Put("10 K"); New_Line;
   Put("35.1 F"); New_Line;
   Put("Please enter a start temperature: ");
   Start := Temperature_Package.Read_Temp(Error);
   while Error loop
      Put("Invalid input, please enter a valid input: ");
      Start := Temperature_Package.Read_Temp(Error);
   end loop;

   Put("Please enter a stop temperature: ");
   Stop := Temperature_Package.Read_Temp(Error);
   while Error loop
      Put("Invalid input, please enter a valid input: ");
      Stop := Temperature_Package.Read_Temp(Error);
   end loop;

   Put("Please enter a step amount of degrees: ");
   Step := Temperature_Package.Read_Degrees(Error);
   while Error loop
      Put("Invalid input, please enter a valid input: ");
      Step := Temperature_Package.Read_Degrees(Error);
   end loop;
   
   if Temperature_Package.Equals(Start, Stop) then
      Put("Start and stop temperatures are equal");
      New_Line;
      return;
   end if;

   Current := Start;
   Table:
      loop
         if Temperature_Package.Less_Than(Start, Stop) /= Temperature_Package.Less_Than(Current, Stop) and not Temperature_Package.Equals(Current, Stop) then
            exit Table;
         end if;

         if Temperature_Package.Less_Than(Start, Stop) then
            Current := Temperature_Package.RaiseIt(Current, Step);
         else
            Current := Temperature_Package.Lower(Current, Step);
         end if;

      -- set_col: https://stackoverflow.com/questions/9876568/how-to-read-some-specific-columns-in-a-file
         set_col(1);
         Put(Temperature_Package.ToF(Current));
         set_col(17);
         Put(Temperature_Package.ToC(Current));
         set_col(32);
         Put(Temperature_Package.TOK(Current));
         New_Line;
         
      end loop Table;

end Temperature_Tester;