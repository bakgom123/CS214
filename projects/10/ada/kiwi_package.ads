-- Kiwi_package.adb gives Kiwi-related declarations,
--  and derives Kiwi from Bird.
-- Created by: David Yoo (gy24)
-- Date: Mar 29, 2022
---------------------------------------------------

with Walking_Bird_Package; use Walking_Bird_Package;

package Kiwi_Package is

	type Kiwi_Type is new Walking_Bird_Type with private;

 	----------------------------------------------------
 	-- A Kiwi's Call (Over-rides Bird.Call())          -
 	-- Receive: A_Kiwi, a Kiwi_Type.                   -
 	-- Return: "Kiwiii!"                              -
 	----------------------------------------------------
	function Call(A_Kiwi : in Kiwi_Type) return String;

 	-----------------------------------------------------
 	-- Determine type of a Kiwi                         -
 	-- (Over-rides Bird.Type_Name())                    -
 	-- Receive: A_Kiwi, a Kiwi_Type.                    -
 	-- Return: "Kiwi".                                  -
 	-----------------------------------------------------
	function Type_Name(A_Kiwi : in Kiwi_Type) return String;

private

	-- Declare Kiwi_Type record in the private section
	-- and to inherit WalkingBird_Type details as well
	type Kiwi_Type is new Walking_Bird_Type with
	record
		null;
	end record;


end Kiwi_Package;