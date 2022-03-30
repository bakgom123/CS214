-- flying_bird_package.adb gives Flying_Bird-related definitions
-- Created by: David Yoo (gy24)
-- Date: Mar 29, 2022

with Ada.Text_IO;
use Ada.Text_IO;

package body Flying_Bird_Package is

	function movement(A_FlyingBird : in Flying_Bird_Type) return String is
	begin
		return "flew past";
	end movement;

end Flying_Bird_Package;