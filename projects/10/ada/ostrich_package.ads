-- Ostrich_package.adb gives Ostrich-related declarations,
--  and derives Ostrich from Bird.
-- Created by: David Yoo (gy24)
-- Date: Mar 29, 2022
---------------------------------------------------

with  Walking_Bird_Package; use  Walking_Bird_Package;

package Ostrich_Package is
    type Ostrich_Type is new Walking_Bird_Type with private;


 ----------------------------------------------------
 -- A Ostrich's Call (Over-rides Bird.Call())           -
 -- Receive: An_Ostrich, an Ostrich_Type.                   -
 -- Return: "Snork!"                                 -
 ----------------------------------------------------
    function  Call(An_Ostrich : in Ostrich_Type) return String;

 -----------------------------------------------------
 -- Determine type of a Ostrich                          -
 -- (Over-rides Bird.Type_Name())                    -
 -- Receive: An_Ostrich, an Ostrich_Type.                    -
 -- Return: "Ostrich".                                   -
 -----------------------------------------------------
    function  Type_Name(An_Ostrich : in Ostrich_Type) return String;

private
    type Ostrich_Type is new Walking_Bird_Type with
    record
        null;
    end record;

end Ostrich_Package;
