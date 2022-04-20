Script started on 2022-04-05 02:16:22-04:00 [TERM="xterm-256color" TTY="/dev/pts/0" COLUMNS="271" LINES="17"]
]0;gy24@remotel1: ~/cs214/projects/11/ada[01;32mgy24@remotel1[00m:[01;34m~/cs214/projects/11/ada[00m$ cat list_package.adb
-- list_package.adb defines Ada linked list operations.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: David Yoo (gy24)
-- Date: Apr 5, 2022
-------------------------------------------------------

with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

package body List_Package is

  -----------------------------------------------------
  -- Initialize a list                                -
  -- Receive: aList, a List.                          -
  -- Pre: aList is uninitialized.                     -
  -- Post: aList%itsFirst == aList%itsLast == NULL && -
  --        aList%itsLength == 0.                     -
  -----------------------------------------------------
  procedure Init(A_List : out List) is
  begin
    A_List.Its_First := null;
    A_List.Its_Last := null;
    A_List.Its_Length := 0;
  end Init;

  ------------------------------------------------
  -- Is a list empty?                            -
  -- Receive: aList, a List.                     -
  -- Return: true, iff aList contains no values. -
  ------------------------------------------------
  function Empty(A_List : in List) return Boolean is
  begin
    return A_List.Its_Length = 0;
  end Empty;

  -------------------------------------
  -- How many values are in a list?   -
  -- Receive: aList, a List.          -
  -- Return: aList%itsLength.         -
  -------------------------------------
  function Length(A_List : in List) return Integer is
  begin
    return A_List.Its_Length;
  end Length;

  ----------------------------------------
  -- Append a value to a list.           -
  -- Receive: aValue, an integer,        -
  -- Passback: aList, containing aValue. -
  ----------------------------------------
  procedure Append(A_Value : in Integer; A_List : in out List) is
    Temp_Ptr : constant Node_Ptr := new List_Node;
  begin
    Temp_Ptr.Its_Value := A_Value;
    Temp_Ptr.Its_Next := null;

    if A_List.Its_Length = 0 then
       A_List.Its_First := Temp_Ptr;
    else
       A_List.Its_Last.Its_Next := Temp_Ptr;
    end if;

    A_List.Its_Last := Temp_Ptr;

    A_List.Its_Length := A_List.Its_Length + 1;
  end Append;

  -------------------------------------
  -- Display the values in a list.    -
  -- Receive: aList, a List.          -
  -- Output: the values in aList.     -
  -------------------------------------

  -- replace this line with the definition of Put()
  procedure Put(A_List : in List) is
     Temp_Ptr : Node_Ptr := A_List.Its_First;
   begin 
     while Temp_Ptr /= null loop
        Put(' '); Put(Temp_Ptr.Its_Value);
        Temp_Ptr := Temp_Ptr.Its_Next;
     end loop;
   end Put;

  ---------------------------------------
  -- Find the maximum value in a list.  -
  -- Receive: aList, a List.            -
  -- Return: the maximum value in aList.-
  ---------------------------------------

  -- replace this line with the definition of Max()
  function Max(A_List: in List) return Integer is
  Temp_Ptr: Node_Ptr := A_List.Its_First;
  Max_Int: Integer := -99999999;
  begin
	  while Temp_Ptr /= null loop
      if Temp_Ptr.Its_Value > Max_Int then
        Max_Int := Temp_Ptr.Its_Value;
      end if;
      Temp_Ptr := Temp_Ptr.Its_Next;
    end loop;
    return Max_Int;
  end Max;


  function Find(A_List: in List; A_Value: in Integer) return Integer is
  Temp_Ptr: Node_Ptr := A_List.Its_First;
  I: Integer := 1;
  begin
	  while Temp_Ptr /= null loop
      if Temp_Ptr.Its_Value = A_Value then
        return I;
      end if;
      I := I +1;
      Temp_Ptr := Temp_Ptr.Its_Next;
    end loop;
    return -1;
  end Find;
    


end List_Package;

]0;gy24@remotel1: ~/cs214/projects/11/ada[01;32mgy24@remotel1[00m:[01;34m~/cs214/projects/11/ada[00m$ cat list_package.adb[Ks
-- list_package.ads declares an Ada linked list and its operations.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: David Yoo (gy24)
-- Date: Apr 5, 2022
------------------------------------------------------------------

package List_Package is

  -- the list-type itself (public)
  type List is private;

  -----------------------------------------------------
  -- Initialize a list                                -
  -- Receive: aList, a List.                          -
  -- Pre: aList is uninitialized.                     -
  -- Post: aList%itsFirst == aList%itsLast == NULL && -
  --        aList%itsLength == 0.                     -
  -----------------------------------------------------
  procedure Init(A_List: out List);


  ------------------------------------------------
  -- Is a list empty?                            -
  -- Receive: aList, a List.                     -
  -- Return: true, iff aList contains no values. -
  ------------------------------------------------
  function Empty(A_List: in List) return Boolean;

  -------------------------------------
  -- How many values are in a list?   -
  -- Receive: aList, a List.          -
  -- Return: aList%itsLength.         -
  -------------------------------------
  function Length(A_List : in List) return Integer;


  ----------------------------------------
  -- Append a value to a list.           -
  -- Receive: aValue, an integer,        -
  -- Passback: aList, containing aValue. -
  ----------------------------------------
  procedure Append(A_Value : in Integer; A_List: in out List);


  -------------------------------------
  -- Display the values in a list.    -
  -- Receive: aList, a List.          -
  -- Output: the values in aList.     -
  -------------------------------------

  -- replace this line with the declaration of Put()
  procedure Put(A_List: in List);


  ---------------------------------------
  -- Find the maximum value in a list.  -
  -- Receive: aList, a List.            -
  -- Return: the maximum value in aList.-
  ---------------------------------------

  -- replace this line with the declaration of Max()
  function Max(A_List: in List) return Integer;


  function Find(A_List: in List; A_Value: in Integer) return Integer;


 private
   -- replace this line with a forward-dec of List_Node
   type List_Node;
   type Node_Ptr is access List_Node;
   type List is
      record
        Its_First: Node_Ptr;
        Its_Last: Node_Ptr;
        Its_Length: Integer;
      end record;
   type List_Node is
          record
           Its_Value : Integer;
           Its_Next : Node_Ptr;
          end record;

end List_Package;

]0;gy24@remotel1: ~/cs214/projects/11/ada[01;32mgy24@remotel1[00m:[01;34m~/cs214/projects/11/ada[00m$ cat list_package.ads[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[Kmax.adb
-- max.adb finds the max of a list of integers, and finds the index of the value 
-- 
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: David Yoo (gy24)
-- Date: Apr 5, 2022
-------------------------------------------------- 
 
with Ada.Text_IO, Ada.Integer_Text_IO, List_Package; 
use Ada.Text_IO, Ada.Integer_Text_IO, List_Package; 
 
procedure Max is 
                              -- define 3 lists 
  List1, List2, List3, list4 : List; 
 
begin 
  Init(List1);                -- initialize them 
  Init(List2); 
  Init(List3); 
 
  Append(99, List1);          -- 99, 88, 77, 66, 55 
  Append(88, List1);          -- max is first 
  Append(77, List1); 
  Append(66, List1); 
  Append(55, List1); 
 
  Append(55, List2);          -- 55, 66, 77, 88, 99 
  Append(66, List2);          -- max is last 
  Append(77, List2); 
  Append(88, List2); 
  Append(99, List2); 
 
  Append(55, List3);          -- 55, 77, 99, 88, 66 
  Append(77, List3);          -- max is in the middle 
  Append(99, List3); 
  Append(88, List3); 
  Append(66, List3); 
  
  Append(55, List4);          -- 55, 77, 11, 88, 66 
  Append(77, List4);          -- max is in the middle 
  Append(11, List4); 
  Append(88, List4); 
  Append(66, List4); 
 
  Put(List1); New_Line;       -- output the 3 lists 
  Put(List2); New_Line; 
  Put(list3); New_Line; 
  Put(list4); New_Line; 

                              -- display their maxima 
  Put("The maximum value in list 1 is ");  
  Put( Max(List1) ); 
  New_Line;
  Put("The index of 99 in list 1 is ");  
  Put( Find(List1, 99) ); 
  New_Line; 
  Put("The maximum value in list 2 is "); 
  Put( Max(List2) );
  New_Line;
  Put("The index of 99 in list 2 is ");  
  Put( Find(List2, 99) ); 
  New_Line; 
  Put("The maximum value in list 3 is ");
  Put( Max(List3) );
  New_Line;
  Put("The index of 99 in list 3 is ");  
  Put( Find(List3, 99) ); 
  New_Line; 
  Put("The maximum value in list 4 is ");
  Put( Max(List4) );
  New_Line;
  Put("The index of 99 in list 4 is ");  
  Put( Find(List4, 99) ); 
  New_Line; 
 
end Max; 

]0;gy24@remotel1: ~/cs214/projects/11/ada[01;32mgy24@remotel1[00m:[01;34m~/cs214/projects/11/ada[00m$ gnatmake max.adb
x86_64-linux-gnu-gcc-7 -c max.adb
x86_64-linux-gnu-gnatbind-7 -x max.ali
x86_64-linux-gnu-gnatlink-7 max.ali
]0;gy24@remotel1: ~/cs214/projects/11/ada[01;32mgy24@remotel1[00m:[01;34m~/cs214/projects/11/ada[00m$ ./max
          99          88          77          66          55
          55          66          77          88          99
          55          77          99          88          66
          55          77          11          88          66
The maximum value in list 1 is          99
The index of 99 in list 1 is           1
The maximum value in list 2 is          99
The index of 99 in list 2 is           5
The maximum value in list 3 is          99
The index of 99 in list 3 is           3
The maximum value in list 4 is          88
The index of 99 in list 4 is          -1
]0;gy24@remotel1: ~/cs214/projects/11/ada[01;32mgy24@remotel1[00m:[01;34m~/cs214/projects/11/ada[00m$ exit

Script done on 2022-04-05 02:16:57-04:00 [COMMAND_EXIT_CODE="0"]
