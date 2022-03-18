-- namer.adb "test-drives" the Name type.
-- Begun by: Prof. Adams, CS 214 at Calvin College.
-- Completed by: David Yoo (gy24)
-- Date: Mar 15, 2022
----------------------------------------------

with Ada.Text_IO; use Ada.Text_IO;

procedure name_tester is

  -- replace this line with the definition of NAME_SIZE
  Name_Size : constant Positive := 8;

  Chars_Read : Natural;

  -- replace this line with the definition of Name
  type Name is record 
    First, Middle, Last : String(1..Name_Size);
  end record;
  aName : Name ;


  ----------------------------------------------
  -- Init initializes a Name variable          -
  -- Receive: theName, the Name variable;      -
  --          First, the first name;           -
  --          Middle, the middle name;         -
  --          Last, the last name.             -
  -- Return: theName, its fields set to First, -
  --               Middle, and Last.           -
  ----------------------------------------------

  -- replace this line with the definition of Init()
  procedure Init (TheName : out Name; First, Middle, Last : in String) is
  begin
    TheName.First := First;
    TheName.Middle := Middle;
    TheName.Last := Last;
  end Init;


  ----------------------------------------------
  -- getFirst(Name) retrieves Name.myFirst        -
  -- Receive: theName, a Name.                 -
  -- PRE: theName has been initialized.        -
  -- Return: theName.myFirst.                  -
  ----------------------------------------------

  -- replace this line with the definition of getFirst()
  function getFirst(TheName : in Name) return String is
  begin
    return TheName.First;
  end getFirst;

  -- replace this line with the doc and def of getMiddle()
  function getMiddle(TheName : in Name) return String is
  begin
    return TheName.Middle;
  end getMiddle;

  -- replace this line with the doc and def of getLast()
  function getLast(TheName : in Name) return String is
  begin
    return TheName.Last;
  end getLast;

  -----------------------------------------------
  -- getFullName(Name) retrieves Name as a String  -
  -- Receive: theName, a Name.                  -
  -- PRE: theName has been initialized.         -
  -- Return: a String representation of theName -
  -----------------------------------------------

  -- replace this line with the definition of getFullName()
  function getFullName(TheName : in Name) return String is
  begin
    return TheName.First & " " & TheName.Middle & " " & TheName.Last;
  end getFullName;

  ----------------------------------------------
  -- Put(Name) displays a Name value.          -
  -- PRE: theName has been initialized.        -
  -- Receive: theName, a Name.                 -
  -- Output: theName, to the screen.           -
  ----------------------------------------------

  -- replace this line with the definition of Put()
  procedure Put (TheName : in Name) is
  begin
    Put(getFullName(TheName));
  end Put;

   ---------------------------------------------------------------
  -- SetFirst(Name, String) sets the first name of a Name.     -
  -- PRE: TheName has been initialized.                        -
  ---------------------------------------------------------------
  procedure setFirst(TheName : out Name; NewFirst : in String) is
  begin
    TheName.First := NewFirst;
  end setFirst;
  
  -----------------------------------------------------------------
  -- SetMiddle(Name, String) sets the middle name of a Name.     -
  -- PRE: TheName has been initialized.                          -
  -----------------------------------------------------------------
  procedure setMiddle(TheName : out Name; NewMiddle : in String) is
  begin
    TheName.Middle := NewMiddle;
  end setMiddle;
  
  ---------------------------------------------------------------
  -- SetLast(Name, String) sets the last name of a Name.        -
  -- PRE: TheName has been initialized.                         -
  ---------------------------------------------------------------
  procedure setLast(TheName : out Name; NewLast : in String) is
  begin
    TheName.Last := NewLast;
  end setLast;
  
  -------------------------------------------------------------------------------
  -- LFMI(Name) returns the name in the order of "last, first middle initial".  -
  -- PRE: TheName has been initialized.                                         -
  -- Receive: TheName, a Name.                                                  - 
  -------------------------------------------------------------------------------
  function LFMI(TheName : in Name) return String is
  begin
    return TheName.Last & ", " & TheName.First & ' ' & TheName.Middle(TheName.Middle'First);
  end LFMI;
  
  --------------------------------------------------------------------------------
  -- ReadName reads a first, middle and last name from the console into a Name. -
  -- PRE: The_Name has been initialized.                                        -
  -- Receive: TheName, a Name.                                                  -
  --------------------------------------------------------------------------------
  procedure ReadName(TheName : out Name) is
  begin
    TheName.First := (others => ' ');
    TheName.Middle := (others => ' ');
    TheName.Last := (others => ' ');
    Get_Line(TheName.First, Chars_Read);
    Get_Line(TheName.Middle, Chars_Read);
    Get_Line(TheName.Last, Chars_Read);
  end ReadName;



begin
   Init(aName, "John    ", "Paul    ", "Jones   ");

   pragma Assert( getFirst(aName) = "John    ", "getFirst() failed");
   pragma Assert( getMiddle(aName) = "Paul    ", "getMiddle() failed");
   pragma Assert( getLast(aName) = "Jones   ", "getLast() failed");
   pragma Assert( getFullName(aName) = "John     Paul     Jones   ", 
                    "getFullName() failed");

  setFirst(aName, "David   ");
  pragma Assert(getFirst(aName) = "David   ", "setFirst failed");
  setMiddle(aName, "Gunju   ");
  pragma Assert(getMiddle(aName) = "Gunju   ", "setMiddle failed");
  setLast(aName, "Yoo     ");
  pragma Assert(getLast(aName) = "Yoo     ", "setLast failed");
  pragma Assert(LFMI(aName) = "Yoo     , David   G", "LMFI failed!");
  
  Put("All tests passed!"); New_line;
  
  Put("Please enter your first, middle, last name and press enter each time you enter your name):"); New_Line;
  ReadName(aName);
  Put(aName);
end name_tester;