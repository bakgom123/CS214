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

} // class RectangleArea