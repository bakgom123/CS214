Script started on 2022-01-14 16:43:49-05:00 [TERM="xterm-256color" TTY="/dev/pts/2" COLUMNS="80" LINES="24"]
]0;gy24@gold32: ~/cs214/projects/01[01;32mgy24@gold32[00m:[01;34m~/cs214/projects/01[00m$ cat rectangle_area.adb
-- rectangle_area.adb compues the area of a rectangle.
--
-- Input: The width and height of the rectangle.
-- Precondition: The width and height are a positive number.
-- Output: The area of the rectangle.
--
-- Begun by: Prof. Adams, CS 214 at Calvin College.
-- Completed by: David Yoo (gy24)
-- Date: 1/14/2022
----------------------------------------------------

with Ada.Text_IO, Ada.Float_Text_IO;
use  Ada.Text_IO, Ada.Float_Text_IO;

procedure circle_area is

   width, height, area : float; 

   -- function rectangleArea computes a rectangle's area, given its width and height
   -- Parameter: w, h, a float
   -- Precondition: w and h are both positive
   -- Return: the area of the rectangle whose width is w and height is h
   ----------------------------------------------------
   function rectangleArea(w: in float; h: in float) return float is 
   begin
      return w*h;
   end rectangleArea;

begin                           
   New_Line;
   Put("To compute the area of a rectangle, enter its width: ");
   Get(width);

   Put("next, enter its height: ");
   Get(height);

   area := rectangleArea(width, height);

   New_Line;
   Put("The rectnagle's area is ");
   Put(area);
   New_Line; New_Line; 

end circle_area;]0;gy24@gold32: ~/cs214/projects/01[01;32mgy24@gold32[00m:[01;34m~/cs214/projects/01[00m$ gnatmake rectangle_area
gnatmake: "rectangle_area" up to date.
]0;gy24@gold32: ~/cs214/projects/01[01;32mgy24@gold32[00m:[01;34m~/cs214/projects/01[00m$ ./rectangle_area

To compute the area of a rectangle, enter its width: 1
next, enter its height: 2

The rectnagle's area is  2.00000E+00

]0;gy24@gold32: ~/cs214/projects/01[01;32mgy24@gold32[00m:[01;34m~/cs214/projects/01[00m$ ./rectangle_area

To compute the area of a rectangle, enter its width: 3 2
next, enter its height: 3

The rectnagle's area is  6.00000E+00

]0;gy24@gold32: ~/cs214/projects/01[01;32mgy24@gold32[00m:[01;34m~/cs214/projects/01[00m$ ./rectangle_area

To compute the area of a rectangle, enter its width: 12
next, enter its height: 14

The rectnagle's area is  1.68000E+02

]0;gy24@gold32: ~/cs214/projects/01[01;32mgy24@gold32[00m:[01;34m~/cs214/projects/01[00m$ exit
exit

Script done on 2022-01-14 16:44:49-05:00 [COMMAND_EXIT_CODE="0"]
