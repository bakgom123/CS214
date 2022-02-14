Script started on 2022-01-26 10:44:47-05:00 [TERM="xterm-256color" TTY="/dev/pts/6" COLUMNS="142" LINES="12"]
]0;gy24@gold33: ~/cs214/labs/03[01;32mgy24@gold33[00m:[01;34m~/cs214/labs/03[00m$ cat Year_code[K[K[K[K[KDo[K[KCodes.java
/* YearCodes.java is a driver for function yearCode().
 *
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Completed by: David Yoo (gy24)
 * Date: 01/26/2022
 ****************************************************************/

import java.util.Scanner;

public class YearCodes {

   public static void main(String[] args) {
      Scanner keyboard = new Scanner(System.in);
      System.out.println("\nEnter your academic year: "); // prompt

      String year = keyboard.next();      // read year
      System.out.println(yearCode(year)); // display its code
   }

   /***************************************************************
    * yearCode() converts an academic year into its integer code.
    *
    * Receive: year, a string.
    * PRE: year is one of {freshman, sophomore, junior, or senior}.
    * Return: the integer code corresponding to year.
    */

    public static int yearCode(String year)
    {
       if (year.equals("freshman"))
          return 1;
       else
          if (year.equals("sophomore"))
             return 2;
          else
             if (year.equals("junior"))
                return 3;
             else
                if (year.equals("senior"))
                   return 4;
                else
                   return 0;
    }

}
]0;gy24@gold33: ~/cs214/labs/03[01;32mgy24@gold33[00m:[01;34m~/cs214/labs/03[00m$ javac -deprecation YearCodes.java
]0;gy24@gold33: ~/cs214/labs/03[01;32mgy24@gold33[00m:[01;34m~/cs214/labs/03[00m$ java YearCodes

Enter your academic year: 
freshman
1
]0;gy24@gold33: ~/cs214/labs/03[01;32mgy24@gold33[00m:[01;34m~/cs214/labs/03[00m$ java YearCodes

Enter your academic year: 
sophomore
2
]0;gy24@gold33: ~/cs214/labs/03[01;32mgy24@gold33[00m:[01;34m~/cs214/labs/03[00m$ java YearCodes

Enter your academic year: 
junior
3
]0;gy24@gold33: ~/cs214/labs/03[01;32mgy24@gold33[00m:[01;34m~/cs214/labs/03[00m$ java YearCodes

Enter your academic year: 
senior
4
]0;gy24@gold33: ~/cs214/labs/03[01;32mgy24@gold33[00m:[01;34m~/cs214/labs/03[00m$ exit

Script done on 2022-01-26 10:45:44-05:00 [COMMAND_EXIT_CODE="0"]
