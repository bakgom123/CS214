-- flying_bird_package.ads gives Flying_Bird-related declaration
-- Created by: David Yoo (gy24)
-- Date: Mar 29, 2022

with Bird_Package; use Bird_Package;

package Flying_Bird_Package is

	type Flying_Bird_Type is new Bird_Type with private;

	function movement(A_FlyingBird : in Flying_Bird_Type) return String;

private

	type Flying_Bird_Type is new Bird_Type with
	record
		null;
	end record;

end Flying_Bird_Package;