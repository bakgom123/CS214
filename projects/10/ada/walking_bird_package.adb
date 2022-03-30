-- walking_bird_package.adb gives Walking_Bird-related definitions
-- Created by: David Yoo (gy24)
-- Date: Mar 29, 2022

with Ada.Text_IO;
use Ada.Text_IO;

package body Walking_Bird_Package is
   function movement(A_WalkingBird: in Walking_Bird_Type) return String is
   begin
      return "walked past";
   end movement;
end Walking_Bird_Package;