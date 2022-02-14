Script started on 2022-02-02 14:21:00-05:00 [TERM="xterm-256color" TTY="/dev/pts/9" COLUMNS="142" LINES="12"]
]0;gy24@gold32: ~/cs214/projects/04[01;32mgy24@gold32[00m:[01;34m~/cs214/projects/04[00m$ javac -deprecation Factorialjava[14Pcat Factorial.java
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
}]0;gy24@gold32: ~/cs214/projects/04[01;32mgy24@gold32[00m:[01;34m~/cs214/projects/04[00m$ cat Factorial.javajavac -deprecation Factorialjava[C[K[K[K[K.java
]0;gy24@gold32: ~/cs214/projects/04[01;32mgy24@gold32[00m:[01;34m~/cs214/projects/04[00m$ java Factorial
To calculate the factorial,
enter an integer: 
5
The factorial of 5 is 120.
]0;gy24@gold32: ~/cs214/projects/04[01;32mgy24@gold32[00m:[01;34m~/cs214/projects/04[00m$ exit

Script done on 2022-02-02 14:21:25-05:00 [COMMAND_EXIT_CODE="0"]
