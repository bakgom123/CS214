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

end circle_area;