/* LogTable.java displays a table of logarithms.
 *
 * Input: start, stop and increment, three doubles.
 * PRE: start < stop && increment > 0.
 * Output: A table of logarithms from start to stop,
 *         with increment as the step value.
 * Begun by: Nelesen, for CS 214 at Calvin College.
 * Completed by: David Yoo (gy24)
 ********************************************************/
import java.util.Scanner; 		// Get input
import java.lang.Math;             // For logarithm

class LogTable{

  public static void main(String[] args){
    Scanner keyboard = new Scanner(System.in);
    System.out.println("To display a table of logarithms,");
    System.out.println("enter the start, stop and increment values: ");
    double start, stop, increment;
    start = keyboard.nextDouble();
    stop = keyboard.nextDouble();
    increment = keyboard.nextDouble();

    //Replace this line with a while loop to generate the table of logs
    double count = 0;
    while (start <= stop){
      count = start;
      System.out.printf("The logarithm of %f is %f\n", count, Math.log10(count));
      start = start + increment;
    }
  }
}

