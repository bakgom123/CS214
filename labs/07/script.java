Script started on 2022-02-22 23:44:21-05:00 [TERM="xterm-256color" TTY="/dev/pts/0" COLUMNS="271" LINES="12"]
]0;gy24@remotel3: ~/cs214/labs/07[01;32mgy24@remotel3[00m:[01;34m~/cs214/labs/07[00m$ cat Average.java
/* Average.java is a driver for method avg().
 *
 * Started by: Prof. Adams, for CS 214 at Calvin College
 *
 * Student Name: David Yoo(gy24)
 * Date: Feb 22, 2022
 *
 * Precondition: theArray, is an array of double values.
 * Output: the average of the numbers in theArray.
 ***************************************************************/

import java.io.*;

public class Average
{
  public static void main(String[] args) {

      // Replace this line with definitions of array0 and array1...
      {
        double[] array0 = new double[0];
        double[] array1 = {9.0, 8.0, 7.0, 6.0};

      // output the average of the values in the arrays
     System.out.println("The first average is " + avg(array0));
     System.out.println("The second average is " + avg(array1));
      }
  }
  

  /* sum() is a method that computes the sum of all the values
   * in an array of doubles.
   * Receive: anArray, an array of doubles.
   * Return: the sum of the values in anArray.
   ************************************************************/

   // Replace this line with the definition of sum()... 
  public static double sum(double[] theArray){ 
    double total = 0.0;
    for (int i = 0; i < theArray.length; i++){
        total += theArray[i];
    }
    return total;
}

  

  /* avg() is a method that computes the average of the values
   * in an array.
   * Receive: anArray, an array of doubles.
   * Return: the average of the values in anArray.
   **************************************************************/
  
   // Replace this line with the definition of avg()...
  public static double avg(double anArray[])
   {
     if (anArray == null || anArray.length <= 0)
        return 0.0;
     else
        return sum(anArray) / anArray.length;
   }

}

]0;gy24@remotel3: ~/cs214/labs/07[01;32mgy24@remotel3[00m:[01;34m~/cs214/labs/07[00m$ javac -deprecation Average.java
]0;gy24@remotel3: ~/cs214/labs/07[01;32mgy24@remotel3[00m:[01;34m~/cs214/labs/07[00m$ java Average
The first average is 0.0
The second average is 7.5
]0;gy24@remotel3: ~/cs214/labs/07[01;32mgy24@remotel3[00m:[01;34m~/cs214/labs/07[00m$ exit

Script done on 2022-02-22 23:44:45-05:00 [COMMAND_EXIT_CODE="0"]
