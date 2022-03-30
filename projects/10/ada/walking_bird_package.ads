-- walking_bird_package.ads gives Flying_Bird-related declaration
-- Created by: David Yoo (gy24)
-- Date: Mar 29, 2022

with Bird_Package;
use Bird_Package;

package Walking_Bird_Package is
   
   type Walking_Bird_Type is new Bird_Type with private;

   function movement(A_WalkingBird: in Walking_Bird_Type) return String;
   
private
   type Walking_Bird_Type is new Bird_Type with
   record
	   null;
   end record;
end Walking_Bird_Package;