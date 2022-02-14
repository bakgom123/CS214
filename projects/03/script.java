Script started on 2022-01-26 14:34:07-05:00 [TERM="xterm-256color" TTY="/dev/pts/7" COLUMNS="101" LINES="12"]
]0;gy24@maroon25: ~/cs214/projects/03[01;32mgy24@maroon25[00m:[01;34m~/cs214/projects/03[00m$ cat GradeCodes.java
/* GradeCodes.java is a driver for function gradeCode().
 *
 * Created by: David Yoo (gy24)
 * Date: 01/26/2022
 ****************************************************************/

import java.util.Scanner;

public class GradeCodes {

   public static void main(String[] args) {
      Scanner scanner = new Scanner(System.in);
      System.out.println("\nEnter your score: "); // prompt

      int score = Integer.parseInt(scanner.next());      // read year
      System.out.println(gradeCode(score)); // display its code
   }
   /***************************************************************
    * gradeCode() converts integer score to string letter grade.
    *
    * Receive: score, an integer.
    * PRE: score is non-negative integer.
    * Return: the string letter grade.
    */

    public static String gradeCode(int score) {
		switch (score / 10)
		{
			case 10: case 9:
				return "A";

			case 8:
				return "B";

			case 7:
				return "C";

			case 6:
				return "D";
                
			default:
				return "F";
		}
    }
}]0;gy24@maroon25: ~/cs214/projects/03[01;32mgy24@maroon25[00m:[01;34m~/cs214/projects/03[00m$ javac -depreaca[K[K[Kcation GradeCodes.java
]0;gy24@maroon25: ~/cs214/projects/03[01;32mgy24@maroon25[00m:[01;34m~/cs214/projects/03[00m$ java GradeCodes

Enter your score: 
98
A
]0;gy24@maroon25: ~/cs214/projects/03[01;32mgy24@maroon25[00m:[01;34m~/cs214/projects/03[00m$ java GradeCodes

Enter your score: 
88
B
]0;gy24@maroon25: ~/cs214/projects/03[01;32mgy24@maroon25[00m:[01;34m~/cs214/projects/03[00m$ java GradeCodes

Enter your score: 
77
C
]0;gy24@maroon25: ~/cs214/projects/03[01;32mgy24@maroon25[00m:[01;34m~/cs214/projects/03[00m$ java GradeCodes

Enter your score: 
66
D
]0;gy24@maroon25: ~/cs214/projects/03[01;32mgy24@maroon25[00m:[01;34m~/cs214/projects/03[00m$ java GradeCodes

Enter your score: 
55
F
]0;gy24@maroon25: ~/cs214/projects/03[01;32mgy24@maroon25[00m:[01;34m~/cs214/projects/03[00m$ exit

Script done on 2022-01-26 14:35:13-05:00 [COMMAND_EXIT_CODE="0"]
