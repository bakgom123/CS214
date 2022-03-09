Script started on 2022-03-09 00:27:19-05:00 [TERM="xterm-256color" TTY="/dev/pts/0" COLUMNS="271" LINES="12"]
]0;gy24@remotel3: ~/cs214/projects/06[01;32mgy24@remotel3[00m:[01;34m~/cs214/projects/06[00m$ cat root.adb
-- root.adb computes the roots of the quadratic equation. (ax^2+bx+c).
--
-- Input: double - a,b,c.
-- Output: The roots of the quadratic equation. (ax^2+bx+c).
--
-- Created by: David Yoo (gy24)
-- Date: Mar 09,2022
--------------------------------------------------------------

with Ada.Text_IO, Ada.Float_Text_IO, Ada.Numerics.Elementary_Functions;
use  Ada.Text_IO, Ada.Float_Text_IO, Ada.Numerics.Elementary_Functions;

procedure root is
    a, b, c, root1, root2 : float := 0.0;
    res : boolean := False;

    -- computeRoots computes the roots of a quadratic equation.
    -- Input: a, a float
    -- Input: b, a float
    -- Input: c, a float
    -- Input: root1, a float to store the first root
    -- Input: root2, a float to store the second root
    -- Output: True if successful, false if not
    function rootFunction(a : in float; b : in float; c : in float; root1 : out float; root2 : out float) return boolean is
        arg : float := 0.0;
    begin
        if a /= 0.0 then
            arg := (b ** 2.0) - (4.0 * a * c);
            if arg >= 0.0 then
                root1 := (-b + Sqrt(arg)) / (2.0 * a);
                root2 := (-b - Sqrt(arg)) / (2.0 * a);
                return True;
            else
                Put("b^2 - 4ac is negative!");
                root1 := 0.0;
                root2 := 0.0;
                return False;
            end if;
        else
            Put("a is zero!");
            root1 := 0.0;
            root2 := 0.0;
            return False;
        end if;
    end rootFunction;

-- main function that receives a,b,c and computes the roots
begin
    Put("Enter a: ");
    Get(a);
    Put("Enter b: ");
    Get(b);
    Put("Enter c: ");
    Get(c);

    res := rootFunction(a, b, c, root1, root2);
    if res then
        Put(root1, 1, 15, 0);
        Put(", ");
        Put(root2, 1, 15, 0);
    end if;
end root;]0;gy24@remotel3: ~/cs214/projects/06[01;32mgy24@remotel3[00m:[01;34m~/cs214/projects/06[00m$ gnatmake root
gnatmake: "root" up to date.
]0;gy24@remotel3: ~/cs214/projects/06[01;32mgy24@remotel3[00m:[01;34m~/cs214/projects/06[00m$ ./r[Kroot
Enter a: 1
Enter b: 2
Enter c: 3
b^2 - 4ac is negative!
]0;gy24@remotel3: ~/cs214/projects/06[01;32mgy24@remotel3[00m:[01;34m~/cs214/projects/06[00m$ ./root
Enter a: 5
Enter b: 13
Enter c: 2
-0.164218336343765, -2.435781717300415
]0;gy24@remotel3: ~/cs214/projects/06[01;32mgy24@remotel3[00m:[01;34m~/cs214/projects/06[00m$ exit

Script done on 2022-03-09 00:27:52-05:00 [COMMAND_EXIT_CODE="0"]
