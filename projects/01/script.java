Script started on 2022-01-14 16:32:38-05:00 [TERM="xterm-256color" TTY="/dev/pts/2" COLUMNS="80" LINES="24"]
]0;gy24@gold32: ~/cs214/projects/01[01;32mgy24@gold32[00m:[01;34m~/cs214/projects/01[00m$ Re4 ctangleArea.javaa                  cat t REctan     ectangleArea.java
/* RectangleArea.java computes the area of a rectangle.
 *
 * Input: The width and height of the rectangle.
 * Precondition: The width and height is a positive number.
 * Output: The area of the rectangle.
 *
 * Begun by: Dr. Adams, for CS 214, at Calvin College.
 * Completed by: David Yoo (gy24)
 * Date: 1/14/2022
 **********************************************************/


import java.util.Scanner;  // include class for Scanner

public class RectangleArea {

     /* function rectangleArea() computes a rectangle's area, given its width and height.
      * Parameter: w, h
      * Precondition: w, h are not negative.
      * Returns: the area of the rectangle
      */
     public static double rectangleArea(double w, double h) {
        return w*h;               // return an expression
     } // rectangleArea method
	
  // main program
  public static void main(String[] args) {
      // prompt for width
      System.out.println("\n\nTo compute the area of a rectangle,");
      System.out.print(" enter its width: ");

      // Create a connection named keyboard to standard in
      Scanner keyboard = new Scanner(System.in);

      //Get the number from the user
      double width = keyboard.nextDouble();

      // prompt for height
      System.out.print(" enter its height: ");

      //Get the number from the user
      double height = keyboard.nextDouble();


      // output area
      System.out.println("\nThe area is " + rectangleArea(width,height) + "\n");
      System.out.printf("The area is %f\n\n", rectangleArea(width,height));
      System.out.printf("The area is %.15f\n\n", rectangleArea(width,height));
  } // main method

} // class RectangleArea]0;gy24@gold32: ~/cs214/projects/01[01;32mgy24@gold32[00m:[01;34m~/cs214/projects/01[00m$ javac -deprecation Rectangle  Area.java
]0;gy24@gold32: ~/cs214/projects/01[01;32mgy24@gold32[00m:[01;34m~/cs214/projects/01[00m$ java C REctangle        ectangle  Area


To compute the area of a rectangle,
 enter its width: 1
 enter its height: 1

The area is 1.0

The area is 1.000000

The area is 1.000000000000000

]0;gy24@gold32: ~/cs214/projects/01[01;32mgy24@gold32[00m:[01;34m~/cs214/projects/01[00m$ java RectangleArea


To compute the area of a rectangle,
 enter its width: 2
 enter its height: 3

The area is 6.0

The area is 6.000000

The area is 6.000000000000000

]0;gy24@gold32: ~/cs214/projects/01[01;32mgy24@gold32[00m:[01;34m~/cs214/projects/01[00m$ java RectangleArea


To compute the area of a rectangle,
 enter its width: 12
 enter its height: 14

The area is 168.0

The area is 168.000000

The area is 168.000000000000000

]0;gy24@gold32: ~/cs214/projects/01[01;32mgy24@gold32[00m:[01;34m~/cs214/projects/01[00m$ exit
exit

Script done on 2022-01-14 16:34:05-05:00 [COMMAND_EXIT_CODE="0"]
