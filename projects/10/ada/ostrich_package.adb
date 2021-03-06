-- Ostrich_package.adb gives Ostrich-related definitions
--  by over-riding Bird-related definitions.
-- Created by: David Yoo (gy24)
-- Date: Mar 29, 2022
---------------------------------------------------

with Ada.Text_IO;
use Ada.Text_IO;

package body Ostrich_Package is


 ----------------------------------------------------
 -- A Ostrich's Call (Over-rides Bird.Call())           -
 -- Receive: An_Ostrich, an Ostrich_Type.                   -
 -- Return: "Whoo!"                                 -
 ----------------------------------------------------
    function Call(An_Ostrich : in Ostrich_Type) return String is
    begin
        return "Snork!";
    end Call;

 -----------------------------------------------------
 -- Determine type of a Ostrich                          -
 -- (Over-rides Bird.Type_Name())                    -
 -- Receive: An_Ostrich, an Ostrich_Type.                    -
 -- Return: "Ostrich".                                   -
 -----------------------------------------------------
    function Type_Name(An_Ostrich : in Ostrich_Type) return String is
    begin
        return "Ostrich";
    end Type_Name;

end Ostrich_Package;
