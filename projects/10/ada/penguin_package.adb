-- Penguin_package.adb gives Penguin-related definitions
--  by over-riding Bird-related definitions.
-- Created by: David Yoo (gy24)
-- Date: Mar 29, 2022
---------------------------------------------------

with Ada.Text_IO;
use Ada.Text_IO;

package body Penguin_Package is


 ----------------------------------------------------
 -- A Penguin's Call (Over-rides Bird.Call())           -
 -- Receive: A_Penguin, an Penguin_Type.                   -
 -- Return: "Huh-huh-huh-huuuuh!"                                 -
 ----------------------------------------------------
    function Call(A_Penguin : in Penguin_Type) return String is
    begin
        return "Huh-huh-huh-huuuuh!";
    end Call;

 -----------------------------------------------------
 -- Determine type of a Penguin                          -
 -- (Over-rides Bird.Type_Name())                    -
 -- Receive: A_Penguin, an Penguin_Type.                    -
 -- Return: "Penguin".                                   -
 -----------------------------------------------------
    function Type_Name(A_Penguin : in Penguin_Type) return String is
    begin
        return "Penguin";
    end Type_Name;

end Penguin_Package;
