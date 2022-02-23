Script started on 2022-02-18 00:32:07-05:00 [TERM="xterm-256color" TTY="/dev/pts/1" COLUMNS="271" LINES="12"]
]0;gy24@remotel1: ~/cs214/labs/06[01;32mgy24@remotel1[00m:[01;34m~/cs214/labs/06[00m$ cat Split.java
/* Split.java is a class and program that splits a string
 * into two substrings.
 * 
 * Begun by: Serita Nelesen
 * Completed by: David Yoo (gy24)
 * Date: Feb 18, 2022
 ***************************************************************/

import java.util.Scanner;

// java class Split
public class Split
{
  // main program
  public static void main(String[] args)
    {
      Scanner keyboard = new Scanner(System.in);
      // prompt for the string
      System.out.println("\nTo split a string, enter the string: ");
      String theString = keyboard.next();
      
      // prompt for splitting position
      System.out.println("\nEnter the split position: ");
      int position = keyboard.nextInt();

      //Create list, compute results and print
      String [] resultList = new String[2];
      splitter(theString, position, resultList);
      System.out.println("\nThe first part is " + resultList[0] + "\n and the second part is " + resultList[1]);
      
    }
  
  /* splitter() splits a string according to the position specified
   * Receive: 	theString - the string to be split
   * 		pos - the position at which to split
   *            resList - an array of strings in which to place results
   *****************************************************/
  // replace this line with a definition for splitter
  public static void splitter(String theString, int pos, String[] results)
  {
    results[0] = theString.substring(0, pos);
    results[1] = theString.substring(pos, theString.length());
  } 

}
]0;gy24@remotel1: ~/cs214/labs/06[01;32mgy24@remotel1[00m:[01;34m~/cs214/labs/06[00m$ cat Split.javapython3 main.pycd ctx_switching[1Ppython3 main.pycd ctx_switchingp proj05-results /home/cs/214/current/gy24[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[22Pscript proj05-resultsclojure -m function_practice[3Pat function_practice.cljlojure -m function_practice[7Pscript proj05-resultscp proj05-results /home/cs/214/current/gy24[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[27Pd ctx_switching[1Ppython3 main.pycd ctx_switching[1Ppython3 main.py[1Pcat Split.java[Kjavac -deprecation Split.java
]0;gy24@remotel1: ~/cs214/labs/06[01;32mgy24@remotel1[00m:[01;34m~/cs214/labs/06[00m$ java Split

To split a string, enter the string: 
hello

Enter the split position: 
0

The first part is 
 and the second part is hello
]0;gy24@remotel1: ~/cs214/labs/06[01;32mgy24@remotel1[00m:[01;34m~/cs214/labs/06[00m$ java Split

To split a string, enter the string: 
hello

Enter the split position: 
3

The first part is hel
 and the second part is lo
]0;gy24@remotel1: ~/cs214/labs/06[01;32mgy24@remotel1[00m:[01;34m~/cs214/labs/06[00m$ java Split

To split a string, enter the string: 
hello

Enter the split position: 
5

The first part is hello
 and the second part is 
]0;gy24@remotel1: ~/cs214/labs/06[01;32mgy24@remotel1[00m:[01;34m~/cs214/labs/06[00m$ exit

Script done on 2022-02-18 00:33:36-05:00 [COMMAND_EXIT_CODE="0"]
