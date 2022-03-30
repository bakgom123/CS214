-- birds.adb tests our Birds type hierarchy.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College
-- Completed by: David Yoo (gy24)
-- Date: Mar 29, 2022
-----------------------------------------------------

with Bird_Package, Duck_Package, Goose_Package, Owl_Package, Penguin_Package, Ostrich_Package, Kiwi_Package, Ada.Text_IO;
use Bird_Package, Duck_Package, Goose_Package, Owl_Package, Penguin_Package, Ostrich_Package, Kiwi_Package, Ada.Text_IO;

procedure Birds is

 Bird1 : Duck_Type;      
 Bird2 : Penguin_Type;       
 Bird3 : Goose_Type;      
 Bird4 : Ostrich_Type;        
 Bird5 : Kiwi_Type;       

begin
   Put("Welcome to the Bird Park!");
   New_Line;
   Init(Bird1, "Donald");
   Put(Bird1); New_Line;


   Init(Bird2, "Peter ");
   Put(Bird2); New_Line;

   Init(Bird3, "Mother");
   Put(Bird3); New_Line;

   Init(Bird4, "Orvile");
   Put(Bird4); New_Line;

   Init(Bird5, "Harry ");
   Put(Bird5); New_Line;

 New_Line;
end Birds;

