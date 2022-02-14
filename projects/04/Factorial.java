/* Factorial.java returns the factorial of the given integer.
 *
 * Input: Integer - n.
 * Output: The factorial of the integer n.
 * Created by: David Yoo (gy24)
 ********************************************************/
import java.util.Scanner; 		// Get input

class Factorial{

  public static void main(String[] args){
    Scanner keyboard = new Scanner(System.in);
    System.out.println("To calculate the factorial,");
    System.out.println("enter an integer: ");
    int n = keyboard.nextInt(); // get the integer from the user

    System.out.printf("The factorial of " + n + " is " + fac_calc(n) + ".\n"); // print out the result
  }

  // Subprogram that computes the factorial
  public static int fac_calc (int n){ 
      int res = 1;
      for (int i = 2; i <= n; i++){
          res *= i;
      }
      return res;
  }
}