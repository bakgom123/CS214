Script started on 2022-03-30 01:26:40-04:00 [TERM="xterm-256color" TTY="/dev/pts/0" COLUMNS="271" LINES="17"]
]0;gy24@remotel1: ~/cs214/projects/10/ada[01;32mgy24@remotel1[00m:[01;34m~/cs214/projects/10/ada[00m$ cat bird_package.adb
-- bird_package.adb gives Bird-related definitions
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: David Yoo (gy24)
-- Date: Mar 29, 2022
---------------------------------------------------

with Ada.Text_IO;
use Ada.Text_IO;

package body Bird_Package is

 	----------------------------------------------------
 	-- initialization                                  -
 	-- Receive: A_Bird, a Bird_Type;                   -
 	--          Name, a String                         -
 	-- Return: a Bird_Type in which My_Name = Name.    -
 	----------------------------------------------------
	procedure Init(A_Bird : out Bird_Type; Name: in String) is
	begin
		A_Bird.My_Name := Name;
	end Init;

 	----------------------------------------------------
 	-- Name accessor                                   -
 	-- Receive: A_Bird, a Bird_Type.                   -
 	-- Return: A_Bird.My_Name.                         -
 	----------------------------------------------------
	function Name(A_Bird : in Bird_Type) return String is
	begin
		return A_Bird.My_Name;
	end Name;

	----------------------------------------------------
 	-- A Bird's Call                                   -
 	-- Receive: A_Bird, a Bird_Type.                   -
 	-- Return: a default bird-call ("Squawk!").        -
 	----------------------------------------------------
	function Call(A_Bird : in Bird_Type) return String is
	begin
		return "Squawwwwwwwwwk!";
	end Call;

 	----------------------------------------------------
 	-- Determine type of a Bird (for derived types)    -
 	-- Receive: A_Bird, a Bird_Type.                   -
 	-- Return: "Bird".                                 -
 	----------------------------------------------------
	function Type_Name(A_Bird: in Bird_Type) return String is
	begin
		return "Bird";
	end Type_Name;

	----------------------------------------------------
 	-- A Bird's Movement                               -
 	-- Receive: A_Bird, a Bird_Type.                   -
 	-- Return: a default bird-movement ("moved!").     -
 	----------------------------------------------------
	function movement(A_Bird: in Bird_Type) return String is
	begin
		return "moved";
	end movement;

 	----------------------------------------------------
 	-- Output a Bird                                   -
 	-- Receive: A_Bird, a Bird or subclass of Bird.    -
 	-- Output: Everything known about A_Bird           -
 	----------------------------------------------------
	procedure Put(A_Bird : in Bird_Type'Class) is
	begin
		Put( Name(A_Bird) );
		Put( ' ' );
		Put( Type_Name(A_Bird) );
		Put( " just " );
		Put( movement(A_Bird) );
		Put( " and said ");
		Put( Call(A_Bird) );
	end Put;

end Bird_Package;
]0;gy24@remotel1: ~/cs214/projects/10/ada[01;32mgy24@remotel1[00m:[01;34m~/cs214/projects/10/ada[00m$ cat bird_package.adb[Ks
-- bird_package.ads gives Bird-related declarations
--
-- Begun by: Dr. Adams, for CS 214 at Calvin College.
-- Completed by: David Yoo (gy24)
-- Date: Mar 29, 2022
---------------------------------------------------

package Bird_Package is

	type Bird_Type is tagged private;

 	----------------------------------------------------
 	-- initialization                                  -
 	-- Receive: A_Bird, a Bird_Type;                   -
 	--          Name, a String                         -
 	-- Return: a Bird_Type whose My_Name = Name.       -
 	----------------------------------------------------
	procedure Init(A_Bird : out Bird_Type; Name: in String);

 	----------------------------------------------------
 	-- Name accessor                                   -
 	-- Receive: A_Bird, a Bird_Type.                   -
 	-- Return: A_Bird.My_Name.                         -
 	----------------------------------------------------
	function Name(A_Bird : in Bird_Type) return String;

 	----------------------------------------------------
 	-- A Bird's Call                                   -
 	-- Receive: A_Bird, a Bird_Type.                   -
 	-- Return: a default bird-call ("Squawk!").        -
 	----------------------------------------------------
	function Call(A_Bird : in Bird_Type) return String;

 	----------------------------------------------------
 	-- Determine type of a Bird (for derived types)    -
 	-- Receive: A_Bird, a Bird_Type.                   -
 	-- Return: "Bird".                                 -
 	----------------------------------------------------
	function Type_Name(A_Bird: in Bird_Type) return String;

 	----------------------------------------------------
 	-- Output a Bird                                   -
 	-- Receive: A_Bird, a Bird or subclass of Bird.    -
 	-- Output: Everything known about A_Bird           -
 	----------------------------------------------------
	procedure Put(A_Bird : in Bird_Type'Class);

	----------------------------------------------------
 	-- A Bird's Movement                               -
 	-- Receive: A_Bird, a Bird_Type.                   -
 	-- Return: a default bird-movement ("moved!").     -
 	----------------------------------------------------
	function movement(A_Bird: in Bird_Type) return String;

private

	-- Declare the private Bird_Type record
	type Bird_Type is tagged record
		My_Name : String(1..6);
	end record;

end Bird_Package;]0;gy24@remotel1: ~/cs214/projects/10/ada[01;32mgy24@remotel1[00m:[01;34m~/cs214/projects/10/ada[00m$ cat bird_package.ads[K[K[K[K[K[K[K[K[K[K[K[K[K[Krds.adb
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

]0;gy24@remotel1: ~/cs214/projects/10/ada[01;32mgy24@remotel1[00m:[01;34m~/cs214/projects/10/ada[00m$ cat birds.adb_package.adsb[C[C[1P_package.adb[1P_package.adb[1P_package.adb[1P_package.adbd_package.adbu_package.adbc_package.adbk_package.adb
-- duck_package.adb gives Duck-related definitions
--  by over-riding Bird-related definitions.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: David Yoo (gy24)
-- Date: Mar 29, 2022
---------------------------------------------------

with Ada.Text_IO;
use Ada.Text_IO;

package body Duck_Package is

 ----------------------------------------------------
 -- A Duck's Call (Over-rides Bird.Call())          -
 -- Receive: A_Duck, a Duck_Type.                   -
 -- Return: "Quack!"                                -
 ----------------------------------------------------
    function Call(A_Duck : in Duck_Type) return String is
    begin
        return "Quack!";
    end Call;

 ------------------------------------------------------------
 -- Determine type of a Duck (Over-rides Bird.Type_Name()) -
 -- Receive: A_Duck, a Duck_Type.                          -
 -- Return: "Duck".                                        -
 -----------------------------------------------------------
    function Type_Name(A_Duck : in Duck_Type) return String is
    begin
        return "Duck";
    end Type_Name;

end Duck_Package;
]0;gy24@remotel1: ~/cs214/projects/10/ada[01;32mgy24@remotel1[00m:[01;34m~/cs214/projects/10/ada[00m$ cat duck_package.adb[Ks
-- duck_package.ads gives Duck-related declarations,
--
--  and derives Duck from Bird.
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: David Yoo (gy24)
-- Date: Mar 29, 2022
---------------------------------------------------

with Flying_Bird_Package; use Flying_Bird_Package;

package Duck_Package is
    type Duck_Type is new Flying_Bird_Type with private;


 ----------------------------------------------------
 -- A Duck's Call (Over-rides Bird.Call())          -
 -- Receive: A_Duck, a Duck_Type.                   -
 -- Return: "Quack!"                                -
 ----------------------------------------------------
    function  Call(A_Duck : in Duck_Type) return String;

 ------------------------------------------------------------
 -- Determine type of a Duck (Over-rides Bird.Type_Name()) -
 -- Receive: A_Duck, a Duck_Type.                          -
 -- Return: "Duck".                                        -
 -----------------------------------------------------------
    function  Type_Name(A_Duck : in Duck_Type) return String;

private
    type Duck_Type is new Flying_Bird_Type with
            record
                null;
            end record;

end Duck_Package;
]0;gy24@remotel1: ~/cs214/projects/10/ada[01;32mgy24@remotel1[00m:[01;34m~/cs214/projects/10/ada[00m$ cat duck_package.ads[C[1P_package.ads[1P_package.ads[1P_package.ads[1P_package.adsf_package.adsl_package.adsy_package.adsi_package.adsn_package.adsg_package.ads[C_package.adsb_package.adsi_package.adsr_package.adsd_package.ads[C_package.ads[1Ppackage.ads[C[C[C[C[C[C[C[C[C[C[C[C[Kb
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

end Flying_Bird_Package;]0;gy24@remotel1: ~/cs214/projects/10/ada[01;32mgy24@remotel1[00m:[01;34m~/cs214/projects/10/ada[00m$ cat flying_bird_package.adb[Ks
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

end Flying_Bird_Package;]0;gy24@remotel1: ~/cs214/projects/10/ada[01;32mgy24@remotel1[00m:[01;34m~/cs214/projects/10/ada[00m$ cat flying_bird_package.adsb[1P_package.adb[1P_package.adb[1P_package.adb[1P_package.adb[1Ppackage.adb[1P_package.adb[1P_package.adb[1P_package.adb[1P_package.adb[1P_package.adb[1P_package.adbg_package.adbo_package.adbo_package.adbs_package.adbe_package.adb
-- goose_package.adb gives Goose-related definitions
--  by over-riding Bird-related definitions.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: David Yoo (gy24)
-- Date: Mar 29, 2022
---------------------------------------------------
with Ada.Text_IO;
use Ada.Text_IO;

package body Goose_Package is

 ----------------------------------------------------
 -- A Goose's Call (Over-rides Bird.Call())         -
 -- Receive: A_Goose, a Goose_Type.                 -
 -- Return: "Honk!"                                 -
 ----------------------------------------------------
    function Call(A_Goose : in Goose_Type) return String is
    begin
        return "Honk!";
    end Call;

 -----------------------------------------------------
 -- Determine type of a Goose                        -
 -- (Over-rides Bird.Type_Name())                    -
 -- Receive: A_Goose, a Goose_Type.                  -
 -- Return: "Goose".                                 -
 -----------------------------------------------------
    function Type_Name(A_Goose : in Goose_Type) return String is
    begin
        return "Goose";
    end Type_Name;


end Goose_Package;
]0;gy24@remotel1: ~/cs214/projects/10/ada[01;32mgy24@remotel1[00m:[01;34m~/cs214/projects/10/ada[00m$ cat goose_package.adb[Ks
-- goose_package.ads gives Goose-related declarations,
--
--  and derives Goose from Bird.
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: David Yoo (gy24)
-- Date: Mar 29, 2022
---------------------------------------------------

with Flying_Bird_Package; use Flying_Bird_Package;

package Goose_Package is

    type Goose_Type is new Flying_Bird_Type with private;


 ----------------------------------------------------
 -- A Goose's Call (Over-rides Bird.Call())         -
 -- Receive: A_Goose, a Goose.                      -
 -- Return: "Honk!"                                 -
 ----------------------------------------------------
    function  Call(A_Goose : in Goose_Type) return String;

 -----------------------------------------------------
 -- Determine type of a Goose                        -
 -- (Over-rides Bird.Type_Name())                    -
 -- Receive: A_Goose, a Goose.                       -
 -- Return: "Goose".                                 -
 -----------------------------------------------------
    function  Type_Name(A_Goose : in Goose_Type) return String;

private
      type Goose_Type is new Flying_Bird_Type with
      record
         null;
      end record;

end Goose_Package;
]0;gy24@remotel1: ~/cs214/projects/10/ada[01;32mgy24@remotel1[00m:[01;34m~/cs214/projects/10/ada[00m$ cat goose_package.ads[C[1P_package.ads=_package.ads[1P_package.ads[1P_package.ads[1P_package.ads[1P_package.ads[1P_package.adsk_package.adsi_package.adsw_package.adsi_package.ads
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


end Kiwi_Package;]0;gy24@remotel1: ~/cs214/projects/10/ada[01;32mgy24@remotel1[00m:[01;34m~/cs214/projects/10/ada[00m$ cat kiwi_package.ads[Kb
-- Kiwi_package.adb gives Kiwi-related definitions
--  by over-riding Bird-related definitions.
-- Created by: David Yoo (gy24)
-- Date: Mar 29, 2022
---------------------------------------------------

with Ada.Text_IO;
use Ada.Text_IO;

package body Kiwi_Package is

 	----------------------------------------------------
 	-- A Kiwi's Call (Over-rides Bird.Call())          -
 	-- Receive: A_Kiwi, a Kiwi_Type.                   -
 	-- Return: "Kiwiii!"                              -
 	----------------------------------------------------
	function Call(A_Kiwi : in Kiwi_Type) return String is
	begin
		return "Kiwiii!";
	end Call;

 	-----------------------------------------------------
 	-- Determine type of a Kiwi                         -
 	-- (Over-rides Bird.Type_Name())                    -
 	-- Receive: A_Kiwi, a Kiwi_Type.                    -
 	-- Return: "Kiwi".                                  -
 	-----------------------------------------------------
	function Type_Name(A_Kiwi : in Kiwi_Type) return String is
	begin
		return "Kiwi";
	end Type_Name;

end Kiwi_Package;
]0;gy24@remotel1: ~/cs214/projects/10/ada[01;32mgy24@remotel1[00m:[01;34m~/cs214/projects/10/ada[00m$ cat kiwi_package.adb[1P_package.adb[1P_package.adb[1P_package.adb[1P_package.adbo_package.adbs_package.adbt_package.adbr_package.adbi_package.adbc_package.adbh_package.adb
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
]0;gy24@remotel1: ~/cs214/projects/10/ada[01;32mgy24@remotel1[00m:[01;34m~/cs214/projects/10/ada[00m$ 
]0;gy24@remotel1: ~/cs214/projects/10/ada[01;32mgy24@remotel1[00m:[01;34m~/cs214/projects/10/ada[00m$ cat ostrich_package.adb[Ks
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
]0;gy24@remotel1: ~/cs214/projects/10/ada[01;32mgy24@remotel1[00m:[01;34m~/cs214/projects/10/ada[00m$ cat ostrich_package.ads[C[1P_package.ads[1P_package.ads[1P_package.ads[1P_package.ads[1P_package.ads[1P_package.adsw_package.adsl_package.ads
-- owl_package.ads gives Owl-related declarations,
--  and derives Owl from Bird.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: David Yoo (gy24)
-- Date: Mar 24, 2022
---------------------------------------------------

with  Flying_Bird_Package; use  Flying_Bird_Package;

package Owl_Package is
    type Owl_Type is new Flying_Bird_Type with private;


 ----------------------------------------------------
 -- A Owl's Call (Over-rides Bird.Call())           -
 -- Receive: An_Owl, an Owl_Type.                   -
 -- Return: "Whoo!"                                 -
 ----------------------------------------------------
    function  Call(An_Owl : in Owl_Type) return String;

 -----------------------------------------------------
 -- Determine type of a Owl                          -
 -- (Over-rides Bird.Type_Name())                    -
 -- Receive: An_Owl, an Owl_Type.                    -
 -- Return: "Owl".                                   -
 -----------------------------------------------------
    function  Type_Name(An_Owl : in Owl_Type) return String;

private
    type Owl_Type is new Flying_Bird_Type with
    record
        null;
    end record;

end Owl_Package;
]0;gy24@remotel1: ~/cs214/projects/10/ada[01;32mgy24@remotel1[00m:[01;34m~/cs214/projects/10/ada[00m$ cat owl_package.ads[Kb
-- owl_package.adb gives Owl-related definitions
--  by over-riding Bird-related definitions.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: David Yoo (gy24)
-- Date: Mar 29, 2022
---------------------------------------------------

with Ada.Text_IO;
use Ada.Text_IO;

package body Owl_Package is


 ----------------------------------------------------
 -- A Owl's Call (Over-rides Bird.Call())           -
 -- Receive: An_Owl, an Owl_Type.                   -
 -- Return: "Whoo!"                                 -
 ----------------------------------------------------
    function Call(An_Owl : in Owl_Type) return String is
    begin
        return "Whoo!";
    end Call;

 -----------------------------------------------------
 -- Determine type of a Owl                          -
 -- (Over-rides Bird.Type_Name())                    -
 -- Receive: An_Owl, an Owl_Type.                    -
 -- Return: "Owl".                                   -
 -----------------------------------------------------
    function Type_Name(An_Owl : in Owl_Type) return String is
    begin
        return "Owl";
    end Type_Name;

end Owl_Package;
]0;gy24@remotel1: ~/cs214/projects/10/ada[01;32mgy24@remotel1[00m:[01;34m~/cs214/projects/10/ada[00m$ cat owl_package.adb[C[1P_package.adb[1P_package.adb[1P_package.adbp_package.adbe_package.adbn_package.adbg_package.adbu_package.adbi_package.adbn_package.adbb_package.adb[1P_package.adb
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
]0;gy24@remotel1: ~/cs214/projects/10/ada[01;32mgy24@remotel1[00m:[01;34m~/cs214/projects/10/ada[00m$ cat penguin_package.adb[Ks
-- Penguin_package.adb gives Penguin-related declarations,
--  and derives Penguin from Bird.
-- Created by: David Yoo (gy24)
-- Date: Mar 29, 2022
---------------------------------------------------

with  Walking_Bird_Package; use  Walking_Bird_Package;

package Penguin_Package is
    type Penguin_Type is new Walking_Bird_Type with private;


 ----------------------------------------------------
 -- A Penguin's Call (Over-rides Bird.Call())           -
 -- Receive: A_Penguin, an Penguin_Type.                   -
 -- Return: "Huh-huh-huh-huuuuh!"                                 -
 ----------------------------------------------------
    function  Call(A_Penguin : in Penguin_Type) return String;

 -----------------------------------------------------
 -- Determine type of a Penguin                          -
 -- (Over-rides Bird.Type_Name())                    -
 -- Receive: A_Penguin, an Penguin_Type.                    -
 -- Return: "Penguin".                                   -
 -----------------------------------------------------
    function  Type_Name(A_Penguin : in Penguin_Type) return String;

private
    type Penguin_Type is new Walking_Bird_Type with
    record
        null;
    end record;

end Penguin_Package;
]0;gy24@remotel1: ~/cs214/projects/10/ada[01;32mgy24@remotel1[00m:[01;34m~/cs214/projects/10/ada[00m$ cat penguin_package.ads[1P_package.ads[1P_package.ads[1P_package.ads[1P_package.ads[1P_package.ads[1P_package.ads[1P_package.adsw_package.adsa_package.adsl_package.adsk_package.adsi_package.adsn_package.adsg_package.ads[C_package.adsb_package.adsi_package.adsr_package.adsd_package.ads
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
end Walking_Bird_Package;]0;gy24@remotel1: ~/cs214/projects/10/ada[01;32mgy24@remotel1[00m:[01;34m~/cs214/projects/10/ada[00m$ cat walking_bird_package.ads[Kb
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
end Walking_Bird_Package;]0;gy24@remotel1: ~/cs214/projects/10/ada[01;32mgy24@remotel1[00m:[01;34m~/cs214/projects/10/ada[00m$ gnatmake birds.adb
gnatmake: "birds" up to date.
]0;gy24@remotel1: ~/cs214/projects/10/ada[01;32mgy24@remotel1[00m:[01;34m~/cs214/projects/10/ada[00m$ ./birds.[K
Welcome to the Bird Park!
Donald Duck just flew past and said Quack!
Peter  Penguin just walked past and said Huh-huh-huh-huuuuh!
Mother Goose just flew past and said Honk!
Orvile Ostrich just walked past and said Snork!
Harry  Kiwi just walked past and said Kiwiii!

]0;gy24@remotel1: ~/cs214/projects/10/ada[01;32mgy24@remotel1[00m:[01;34m~/cs214/projects/10/ada[00m$ exit

Script done on 2022-03-30 01:28:59-04:00 [COMMAND_EXIT_CODE="0"]
