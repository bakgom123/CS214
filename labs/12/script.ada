Script started on 2022-04-09 19:12:36-04:00 [TERM="xterm-256color" TTY="/dev/pts/0" COLUMNS="151" LINES="9"]
]0;gy24@gold12: ~/cs214/labs/12/ada[01;32mgy24@gold12[00m:[01;34m~/cs214/labs/12/ada[00m$ gnatmake tasked_as[Krray_sum[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[Kcat tast[Kked_array_sum.adb
-- tasked_array_sum.adb sums the values from an input file using an array with different numbers of threads.
--
-- Begun by: Prof. Adams, for CS 214 at Calvin College.
-- Completed by: David Yoo (gy24)
-- Date: Apr 9, 2022
--
-- Usage: array_sum <inFileName>
-------------------------------------------------------------------

with Ada.Text_IO,            -- string output
     Ada.Integer_Text_IO,    -- integer output
     Ada.Command_Line,       -- Argument()
     Ada.Real_Time;          -- Clock, Time, etc.

use  Ada.Text_IO, Ada.Integer_Text_IO, Ada.Real_Time;

procedure tasked_array_sum is

   package Long_IO is new Integer_IO(Long_Integer); use Long_IO;

   type Int_Array is array (Integer range <>) of Long_Integer;
   type Int_Array_Pointer is access Int_Array;

   Values: Int_Array_Pointer;
   Total:  Long_Integer;
   Start_Time, Stop_Time:  Ada.Real_Time.Time;
   Time_Required: Duration;
   
   task type Array_Adder_Task is
      entry Sum(ID, Slice_Size: in Integer);
      entry Report(Result: out Long_Integer);
   end;
   
   
   function Sum_Slice(V: in Int_Array_Pointer; Start, Stop: in Integer) return Long_Integer is
      Partial_Sum: Long_Integer := 0;
   begin
      for i in Start..Stop loop
	 Partial_Sum := Partial_Sum + V(i);
      end loop;
      return Partial_Sum;
   end Sum_Slice;
   
 task body Array_Adder_Task is
      My_Total : Long_Integer := 0;
      My_Start_Index, My_Stop_Index : Integer;
   begin
         accept sum(ID, Slice_Size: in Integer) do
            My_Start_Index := ID * Slice_Size;
            My_Stop_Index := My_Start_Index + Slice_Size - 1;
         end; 

         My_Total := Sum_Slice(Values, 
                                My_Start_Index,
                                My_Stop_Index);

         accept report(Result: out Long_Integer) do
            Result := My_Total;
         end; 
   end Array_Adder_Task;
   
   
   function Sum_In_Parallel(Values: in Int_Array_Pointer;
                            Num_Tasks: in Integer) return Long_Integer is
      Partial_Result, Result: Long_Integer := 0;
      Leftovers, Slice_Size, Start, Stop : Integer;

      type Task_Array is array(Integer range <>) of Array_Adder_Task;
      type Task_Array_Ptr is access Task_Array;
      Adder_Tasks : Task_Array_Ptr;

   begin
      Slice_Size := Values'Length / Num_Tasks;
      Adder_Tasks := new Task_Array(1..Num_Tasks-1);

      for task_ID in 1..NUM_TASKS-1 loop
         Adder_Tasks(task_ID).sum(task_ID, Slice_Size);
      end loop;

      Result := Sum_Slice(Values, 0, Slice_Size-1);

      Leftovers := Values'Length REM Num_Tasks;

      if ( Leftovers > 0 ) then
         Start := Values'Length - Leftovers;
         Stop := Values'Length - 1;
         for i in Start..Stop loop
            Result := Result + Values(i);
         end loop;
      end if;

      for task_ID in 1..Num_Tasks-1 loop
         Adder_Tasks(task_ID).report(Partial_Result);
         Result := Result + Partial_Result;
      end loop;

      return Result;
   end Sum_In_Parallel;
   
   --
   -- check for command-line arguments
   --
   procedure Check_Command_Line is
   begin
      if Ada.Command_Line.Argument_Count /= 1 then
         New_line;
         Put("Usage: array_sum <inFileName> <numTasks>");
         New_line; New_line;
         Ada.Command_Line.Set_Exit_Status(1);
      end if;
   end Check_Command_Line;

   -- fill array with values from an input file
   -- Parameters: File_Name, a String
   --             V, a pointer to a dynamic array
   -- Precondition: File_Name is the name of a valid input file
   --            && its first line is the N, the number of
   --                (other) numbers in the file.
   -- Postcondition: V points to a dynamic array of length N
   --                 containing the N items from the input file.
   --
   procedure Read_File(File_Name: in String; V: in out Int_Array_Pointer) is
      Size:   Integer;
      Number_File : File_Type;
   begin
     Open(File => Number_File,
            Mode => In_File,
            Name => File_Name); 
      Get(Number_File, Size);
      V := new Int_Array(0..Size-1);
      for i in V'Range loop
         Get(Number_File, V(i));
      end loop;
   end Read_File;

   -- Output results
   -- Parameter: Result, the sum of the array's values
   --            Compute_Time, how long it took to sum them.
   -- Postcondition: Result and Compute_Time have been
   --                 displayed on the console.
   --
   procedure Display(Result: in Long_Integer; Compute_Time: in Duration) is
   begin
      New_line;
      Put("The sum is ");
      Put(Result);
      New_line;
      Put(" and computing it took "); 
      Put(Duration'Image (Compute_Time));
      Put(" secs.");
      New_line; New_line;
   end Display;


begin
   Check_Command_Line;
   Read_File( Ada.Command_Line.Argument(1), Values );
   Start_Time := Clock;
   Total := Sum_In_Parallel(Values, Integer'Value(Ada.Command_Line.Argument(2)));
   Stop_Time := Clock;
   Time_Required := Ada.Real_Time.To_Duration(Stop_Time - Start_Time);
   Display(Total, Time_Required);
end tasked_array_sum;
]0;gy24@gold12: ~/cs214/labs/12/ada[01;32mgy24@gold12[00m:[01;34m~/cs214/labs/12/ada[00m$ gnatmake tasked_array_sum.adb
gnatmake: "tasked_array_sum" up to date.
]0;gy24@gold12: ~/cs214/labs/12/ada[01;32mgy24@gold12[00m:[01;34m~/cs214/labs/12/ada[00m$ ./[K[K./tasked_array_sum ../numbers/1000000numbers.txt 1[1P[1P[1P[1P[1@0[1@0[1@0[1@0[C[C[C[C[C[C[C[C[C[C[C[C[C

Usage: array_sum <inFileName> <numTasks>


The sum is             50473230
 and computing it took  0.002191940 secs.

]0;gy24@gold12: ~/cs214/labs/12/ada[01;32mgy24@gold12[00m:[01;34m~/cs214/labs/12/ada[00m$ ./tasked_array_sum ../numbers/1000000numbers.txt 1[K4

Usage: array_sum <inFileName> <numTasks>


The sum is             50473230
 and computing it took  0.000867145 secs.

]0;gy24@gold12: ~/cs214/labs/12/ada[01;32mgy24@gold12[00m:[01;34m~/cs214/labs/12/ada[00m$ exit

Script done on 2022-04-09 19:14:00-04:00 [COMMAND_EXIT_CODE="1"]
