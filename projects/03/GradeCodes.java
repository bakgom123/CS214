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
}